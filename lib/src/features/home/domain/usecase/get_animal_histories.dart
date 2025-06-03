import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../../../../core/shared/entities/animal.dart';
import '../repository/home_repository.dart';

class GetAnimalHistories implements UseCaseWithoutParams<List<CoreAnimal>>{
  final HomeRepository _repository;

  const GetAnimalHistories({required HomeRepository repository}) : _repository = repository;

  @override
  ResultFuture<List<CoreAnimal>> call() => _repository.getAnimalHistories();
}