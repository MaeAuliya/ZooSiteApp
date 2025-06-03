import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/bloc/home_bloc.dart';
import '../../domain/entities/classification_animal.dart';
import '../../domain/entities/image_classification_params.dart';
import '../../domain/usecases/classify_image.dart';
import '../../domain/usecases/take_image.dart';

part 'classification_event.dart';
part 'classification_state.dart';

class ClassificationBloc extends Bloc<ClassificationEvent, ClassificationState> {
  final TakeImage _takeImage;
  final ClassifyImage _classifyImage;

  ClassificationBloc({
    required TakeImage takeImage,
    required ClassifyImage classifyImage,
  })  : _takeImage = takeImage,
        _classifyImage = classifyImage,
        super(const ClassificationInitial()) {
    on<ClassificationEvent>((event, emit) {
      emit(ClassificationLoading());
    });
    on<TakeImageEvent>(_takeImageHandler);
    on<ClassifyImageEvent>(_classifyImageHandler);
  }

  Future<void> _takeImageHandler(
    TakeImageEvent event,
    Emitter<ClassificationState> emit,
  ) async {
    final result = await _takeImage(event.source);
    result.fold(
      (failure) => emit(TakeImageError(failure.errorMessage)),
      (image) {
        if (image != null) {
          return emit(TakeImageSuccess(image));
        } else {
          return emit(TakeImageFailed());
        }
      },
    );
  }

  Future<void> _classifyImageHandler(
    ClassifyImageEvent event,
    Emitter<ClassificationState> emit,
  ) async {
    emit(ClassifyImageLoading());
    final result = await _classifyImage(event.params);
    result.fold(
      (failure) => emit(ClassifyImageError(failure.errorMessage)),
      (animal) => emit(ClassifyImageSuccess(animal)),
    );
  }
}
