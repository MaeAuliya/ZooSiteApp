import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../../../core/shared/entities/animal.dart';
import '../../domain/repository/home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _localDataSource;

  const HomeRepositoryImpl({required HomeLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  @override
  ResultFuture<List<CoreAnimal>> getAnimalHistories() async {
    try {
      final result = await _localDataSource.getAnimalHistories();
      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure.fromException(e));
    }
  }
}