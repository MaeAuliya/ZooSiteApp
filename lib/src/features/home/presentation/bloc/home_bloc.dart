import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/entities/animal.dart';
import '../../domain/usecase/get_animal_histories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAnimalHistories _getAnimalHistories;

  HomeBloc({
    required GetAnimalHistories getAnimalHistories,
  })  : _getAnimalHistories = getAnimalHistories,
        super(const HomeInit()) {
    on<HomeEvent>((event, emit){
      emit(HomeLoading());
    });
    on<GetAnimalHistoriesEvent>(_getAnimalHistoriesHandler);
    on<OpenImageSourceBottomSheetEvent>(_openImageSourceBottomSheetHandler);
    on<OpenDialogOnConstructionEvent>(_openDialogOnConstructionHandler);
  }

  Future<void> _getAnimalHistoriesHandler(
    GetAnimalHistoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getAnimalHistories();
    result.fold(
      (errorMessage) => emit(GetAnimalHistoriesError(errorMessage.message)),
      (histories) => emit(GetAnimalHistoriesSuccess(histories: histories)),
    );
  }

  Future<void> _openImageSourceBottomSheetHandler(
    OpenImageSourceBottomSheetEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(OpenImageSourceBottomSheetSuccess());
  }

  Future<void> _openDialogOnConstructionHandler(
    OpenDialogOnConstructionEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(OpenDialogOnConstructionSuccess());
  }
}
