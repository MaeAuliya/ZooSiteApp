import '../../../../core/shared/entities/animal.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/classification_animal.dart';
import '../entities/image_classification_params.dart';

abstract class ImageClassificationRepository {
  const ImageClassificationRepository();

  ResultFuture<String?> takeImage(String source);

  ResultFuture<ClassificationAnimal> classifyImage(ImageClassificationParams params);
}