import 'package:equatable/equatable.dart';

import '../../../../core/enums/classification_model_type.dart';

class ImageClassificationParams extends Equatable {
  final String image;
  final ClassificationModelType modelName;
  final int resizeTo;

  const ImageClassificationParams({
    required this.image,
    required this.modelName,
    required this.resizeTo,
  });

  @override
  List<Object?> get props => [
        image,
        modelName,
        resizeTo,
      ];
}
