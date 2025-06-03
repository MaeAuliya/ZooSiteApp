import '../../../../core/enums/classification_model_type.dart';
import '../../domain/entities/image_classification_params.dart';

class ImageClassificationParamsModel extends ImageClassificationParams {
  const ImageClassificationParamsModel({
    required super.image,
    required super.modelName,
    required super.resizeTo,
  });

  const ImageClassificationParamsModel.empty()
      : super(
          image: '',
          modelName: ClassificationModelType.fuadah,
          resizeTo: 0,
        );

  ImageClassificationParamsModel.fromEntity(ImageClassificationParams entity)
      : super(
          image: entity.image,
          modelName: entity.modelName,
          resizeTo: entity.resizeTo,
        );
}
