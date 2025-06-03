import '../../../../core/utils/typedef.dart';
import '../../../../core/shared/entities/animal.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<List<CoreAnimal>> getAnimalHistories();
}