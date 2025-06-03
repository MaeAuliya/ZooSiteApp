import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as image;
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../../../core/enums/classification_model_type.dart';
import '../../../../core/enums/image_picker_type.dart';
import '../../../../core/errors/exception.dart';
import '../models/classification_animal _model.dart';
import '../models/classifier_model.dart';
import '../models/image_classification_params_model.dart';

abstract class ImageClassificationLocalDataSource {
  const ImageClassificationLocalDataSource();

  Future<String?> takeImage(String source);

  Future<ClassificationAnimalModel> classifyImage(ImageClassificationParamsModel params);
}

class ImageClassificationLocalDataSourceImpl implements ImageClassificationLocalDataSource {
  final ImagePicker _imagePicker;

  const ImageClassificationLocalDataSourceImpl({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  Future<ClassifierModel> _loadModel({required String modelFileName}) async {
    try {
      final interpreterOptions = InterpreterOptions();
      interpreterOptions.threads = 4;
      final interpreter = await Interpreter.fromAsset(
        modelFileName,
        options: interpreterOptions,
      );

      final inputShape = interpreter.getInputTensor(0).shape;
      final outputShape = interpreter.getOutputTensor(0).shape;

      debugPrint(inputShape.toString());
      debugPrint(inputShape.toString());


      final inputType = interpreter.getInputTensor(0).type;
      final outputType = interpreter.getOutputTensor(0).type;

      debugPrint(inputType.toString());
      debugPrint(outputType.toString());

      return ClassifierModel(
        interpreter: interpreter,
        inputShape: inputShape,
        outputShape: outputShape,
        inputType: inputType,
        outputType: outputType,
      );
    } on LocalException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: e.toString());
    }
  }

  Future<List<double>> _preProcessInput({
    required String img,
    required int resizeTo,
  }) async {
    try {
      final file = File(img);
      final rawImage = image.decodeImage(file.readAsBytesSync());
      if (rawImage == null) {
        throw LocalException(message: 'Cannot decode image.');
      }

      // Crop ke persegi
      final minLength = min(rawImage.width, rawImage.height);
      final cropped = image.copyCrop(
        rawImage,
        ((rawImage.width - minLength) / 2).round(),
        ((rawImage.height - minLength) / 2).round(),
        minLength,
        minLength,
      );

      // Resize ke ukuran model
      final resized = image.copyResize(cropped, width: resizeTo, height: resizeTo);

      // Konversi ke normalisasi float32
      final imagePixels = resized.getBytes();
      final input = List.generate(
        resizeTo,
        (y) => List.generate(
          resizeTo,
          (x) {
            final pixelIndex = (y * resizeTo + x) * 4;
            final r = imagePixels[pixelIndex] / 255.0;
            final g = imagePixels[pixelIndex + 1] / 255.0;
            final b = imagePixels[pixelIndex + 2] / 255.0;
            return [r, g, b];
          },
        ),
      );

      // Konversi ke flat buffer
      final flatInput = input.expand((row) => row).expand((pixel) => pixel).toList();

      return flatInput;
    } on LocalException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<ClassificationAnimalModel> classifyImage(ImageClassificationParamsModel params) async {
    try {
      final stopwatch = Stopwatch()..start();

      final classifier = await _loadModel(
        modelFileName: ClassificationModelTypeEnums.getModelFile(params.modelName),
      );
      final input = await _preProcessInput(
        img: params.image,
        resizeTo: params.resizeTo,
      );

      var outputBuffer =
          List.filled(classifier.outputShape[1], 0.0).reshape([1, classifier.outputShape[1]]);

      final reshapedInput = input.reshape(classifier.inputShape);
      classifier.interpreter.run(reshapedInput, outputBuffer);

      stopwatch.stop();
      final durationInMilliseconds = stopwatch.elapsedMicroseconds / 1e6;

      var prediction = List<double>.from(outputBuffer[0]);
      var maxIndex = prediction.indexWhere((e) => e == prediction.reduce((a, b) => a > b ? a : b));
      var accuration = prediction[maxIndex];
      var name = 'Fanny';
      // var calories = Constant.calories[maxIndex];

      final animal = ClassificationAnimalModel(
        name: name,
        scienceName: 'Fanny Kontolius',
        uniqueFact: 'Fanny Kontolius',
        image: params.image,
        computeTime: durationInMilliseconds,
        accuration: accuration,
      );

      return animal;
    } on LocalException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<String?> takeImage(String source) async {
    try {
      final pickedImage = await _imagePicker.pickImage(
        source: (source == ImagePickerTypeEnums.camera) ? ImageSource.camera : ImageSource.gallery,
        preferredCameraDevice: CameraDevice.rear,
      );

      if (pickedImage == null) {
        return null;
      }

      final fileExtension = pickedImage.path.split('.').last.toLowerCase();

      if (fileExtension == 'gif' || fileExtension == 'webp') {
        throw LocalException(message: 'File format not supported.');
      }

      return pickedImage.path;
    } on LocalException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: 'Something error in taking image');
    }
  }
}
