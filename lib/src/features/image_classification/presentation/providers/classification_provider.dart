import 'package:flutter/cupertino.dart';

import '../../domain/entities/classification_animal.dart';

class ClassificationProvider extends ChangeNotifier {
  String? _image;

  String? get image => _image;

  void updateImage(String newImage) {
    _image = newImage;
    notifyListeners();
  }

  ClassificationAnimal? _animal;
  ClassificationAnimal? get animal => _animal;
}
