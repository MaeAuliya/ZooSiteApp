import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/image_classification_repository.dart';

class TakeImage implements UseCaseWithParams<String?, String>{
  final ImageClassificationRepository _repository;

  const TakeImage({required ImageClassificationRepository repository}) : _repository = repository;

  @override
  ResultFuture<String?> call(String source) => _repository.takeImage(source);
}