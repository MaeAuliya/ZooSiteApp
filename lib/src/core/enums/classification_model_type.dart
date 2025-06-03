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
}
