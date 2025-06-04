import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/shared/models/animal_model.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();

  Future<List<CoreAnimalModel>> getAnimalHistories();
}

List<CoreAnimalModel> tempHistories = [];

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final ImagePicker _imagePicker;

  const HomeLocalDataSourceImpl({
    required ImagePicker imagePicker,
  }) : _imagePicker = imagePicker;

  @override
  Future<List<CoreAnimalModel>> getAnimalHistories() async {
    try {
      final dummyTempHistories = List.generate(
        6,
        (index) => CoreAnimalModel(
          name: (index.isEven) ? 'Maximus Elephant' : 'Maximus Lion',
          scienceName: (index.isEven) ? 'Elephas Maximus' : 'Leona Maximus',
          uniqueFact: 'Uniques Fact ${index + 1}',
          image: (index.isEven) ? MediaRes.dummyElephantImages : MediaRes.dummyLionImages,
          description: 'desc $index'
        ),
      );

      tempHistories.addAll(dummyTempHistories);

      return tempHistories;
    } on LocalException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: e.toString());
    }
  }
}
