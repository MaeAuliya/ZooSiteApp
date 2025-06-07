import '../res/models.dart';

enum ClassificationModelType {
  kusumo,
  auliya,
  fuadah,
}

class ClassificationModelTypeEnums {
  static const _baseModels = 'assets/models';

  static String getModelFile(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return '$_baseModels/kusumo_model.tflite';
      case ClassificationModelType.auliya:
        return '$_baseModels/auliya_model.tflite';
      case ClassificationModelType.fuadah:
        return '$_baseModels/fuadah_model.tflite';
    }
  }

  static int getOutputShape(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return 39;
      case ClassificationModelType.auliya:
        return 8;
      case ClassificationModelType.fuadah:
        return 26;
    }
  }

  static List<String> getAnimalName(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return Models.kusumoAnimals;
      case ClassificationModelType.auliya:
        return Models.auliyaAnimals;
      case ClassificationModelType.fuadah:
        return Models.fuadahAnimals;
    }
  }

  static List<String> getAnimalImage(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return Models.kusumoImagePaths;
      case ClassificationModelType.auliya:
        return Models.auliyaImagePaths;
      case ClassificationModelType.fuadah:
        return Models.fuadahImagePaths;
    }
  }

  static List<String> getAnimalLatinName(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return Models.kusumoAnimalLatins;
      case ClassificationModelType.auliya:
        return Models.auliyaAnimalLatins;
      case ClassificationModelType.fuadah:
        return Models.fuadahAnimalLatins;
    }
  }

  static List<String> getAnimalUniqueFact(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return Models.kusumoAnimalUniqueFacts;
      case ClassificationModelType.auliya:
        return Models.auliyaAnimalUniqueFacts;
      case ClassificationModelType.fuadah:
        return Models.fuadahUniqueFacts;
    }
  }

  static List<String> getAnimalDesc(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return Models.kusumoAnimalDesc;
      case ClassificationModelType.auliya:
        return Models.auliyaAnimalDesc;
      case ClassificationModelType.fuadah:
        return Models.fuadahAnimalDesc;
    }
  }

  static int getModelShape(ClassificationModelType model) {
    switch (model) {
      case ClassificationModelType.kusumo:
        return 299;
      case ClassificationModelType.auliya:
        return 224;
      case ClassificationModelType.fuadah:
        return 224;
    }
  }
}
