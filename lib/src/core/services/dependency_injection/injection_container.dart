import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/home/data/datasources/home_local_data_source.dart';
import '../../../features/home/data/repository/home_repository_impl.dart';
import '../../../features/home/domain/repository/home_repository.dart';
import '../../../features/home/domain/usecase/get_animal_histories.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/image_classification/data/datasources/image_classification_local_data_source.dart';
import '../../../features/image_classification/data/repositories/image_classification_repository_impl.dart';
import '../../../features/image_classification/domain/repositories/image_classification_repository.dart';
import '../../../features/image_classification/domain/usecases/classify_image.dart';
import '../../../features/image_classification/domain/usecases/take_image.dart';
import '../../../features/image_classification/presentation/bloc/classification_bloc.dart';

part 'injection_container_main.dart';