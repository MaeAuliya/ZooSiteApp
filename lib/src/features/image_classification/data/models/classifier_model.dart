import '../../../../core/utils/typedef.dart';
import '../../domain/entities/classifier.dart';

class ClassifierModel extends Classifier {
  const ClassifierModel({
    required super.interpreter,
    required super.inputShape,
    required super.outputShape,
    required super.inputType,
    required super.outputType,
  });

  ClassifierModel.fromMap(DataMap map)
      : super(
    interpreter: map['interpreter'],
    inputShape: map['inputShape'],
    outputShape: map['outputShape'],
    inputType: map['inputType'],
    outputType: map['outputType'],
  );

  DataMap toMap() {
    return {
      'interpreter': super.interpreter,
      'inputShape': super.inputShape,
      'outputShape': super.outputShape,
      'inputType': super.inputType,
      'outputType': super.outputType,
    };
  }

  @override
  String toString() {
    return 'Classifier{interpreter: ${interpreter.toString()}, inputShape: $inputShape, '
        'outputShape: $outputShape, inputType: $inputType, outputType: $outputType}';
  }
}