import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/classification_animal.dart';
import '../entities/image_classification_params.dart';
import '../repositories/image_classification_repository.dart';

class ClassifyImage implements UseCaseWithParams<ClassificationAnimal, ImageClassificationParams> {
  final ImageClassificationRepository _repository;

  const ClassifyImage({required ImageClassificationRepository repository})
      : _repository = repository;

  @override
  ResultFuture<ClassificationAnimal> call(ImageClassificationParams params) =>
      _repository.classifyImage(params);
}
