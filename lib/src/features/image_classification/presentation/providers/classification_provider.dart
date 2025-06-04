import 'package:flutter/cupertino.dart';

import '../../../../core/enums/classification_model_type.dart';
import '../../data/models/classification_animal _model.dart';
import '../../domain/entities/classification_animal.dart';

class ClassificationProvider extends ChangeNotifier {
  void init() {
    _image = null;
    _animal = null;
  }

  String? _image;

  String? get image => _image;

  void updateImage(String newImage) {
    _image = newImage;
    notifyListeners();
  }

  ClassificationModelType? _currentAnimalModel;

  ClassificationModelType? get currentAnimalModel => _currentAnimalModel;

  ClassificationModelType get fishModel => ClassificationModelType.fuadah;

  void updateModel(ClassificationModelType model) {
    _currentAnimalModel = model;
    notifyListeners();
  }

  ClassificationAnimalModel? _animal;

  ClassificationAnimalModel? get animal => _animal;

  void updateAnimal(ClassificationAnimal newAnimal) {
    _animal = ClassificationAnimalModel.fromEntity(newAnimal);
    notifyListeners();
  }
}
