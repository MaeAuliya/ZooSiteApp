part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initialization() async {
  final imagePicker = ImagePicker();

  await _initCore(
    imagePicker: imagePicker,
  );
  // initiate your dependency asynchronously but still parallel
  await Future.wait([
    _initHome(),
    _initClassification(),
    // Feature B
  ]);
}

Future<void> _initCore({
  required ImagePicker imagePicker,
}) async {
  sl.registerLazySingleton(() => imagePicker);
}

Future<void> _initHome() async {
  sl
    // Bloc
    ..registerFactory(() => HomeBloc(
          getAnimalHistories: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => GetAnimalHistories(repository: sl()))

    // Repository
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
          localDataSource: sl(),
        ))

    // Data Sources
    ..registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl(
          imagePicker: sl(),
        ));
}

Future<void> _initClassification() async {
  sl
    // Bloc
    ..registerFactory(() => ClassificationBloc(
          takeImage: sl(),
          classifyImage: sl(),
        ))

    // Usecases
    ..registerLazySingleton(() => TakeImage(repository: sl()))
    ..registerLazySingleton(() => ClassifyImage(repository: sl()))

    // Repository
    ..registerLazySingleton<ImageClassificationRepository>(() => ImageClassificationRepositoryImpl(
          localDataSource: sl(),
        ))

    // Data Sources
    ..registerLazySingleton<ImageClassificationLocalDataSource>(
        () => ImageClassificationLocalDataSourceImpl(
              imagePicker: sl(),
            ));
}
