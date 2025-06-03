import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/classification_animal.dart';
import '../../domain/entities/image_classification_params.dart';
import '../../domain/repositories/image_classification_repository.dart';
import '../datasources/image_classification_local_data_source.dart';
import '../models/image_classification_params_model.dart';

class ImageClassificationRepositoryImpl implements ImageClassificationRepository {
  final ImageClassificationLocalDataSource _localDataSource;

  const ImageClassificationRepositoryImpl(
      {required ImageClassificationLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  ResultFuture<ClassificationAnimal> classifyImage(ImageClassificationParams params) async {
    try {
      final paramsModel = ImageClassificationParamsModel.fromEntity(params);
      final result = await _localDataSource.classifyImage(paramsModel);
      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure.fromException(e));
    }
  }

  @override
  ResultFuture<String?> takeImage(String source) async {
    try {
      final result = await _localDataSource.takeImage(source);
      return Right(result);
    } on LocalException catch (e) {
      return Left(LocalFailure.fromException(e));
    }
  }
}
