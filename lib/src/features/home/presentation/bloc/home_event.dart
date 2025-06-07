part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class GetAnimalHistoriesEvent extends HomeEvent {
  const GetAnimalHistoriesEvent();
}

final class OpenImageSourceBottomSheetEvent extends HomeEvent {
  const OpenImageSourceBottomSheetEvent();
}

final class OpenDialogOnConstructionEvent extends HomeEvent {
  const OpenDialogOnConstructionEvent();
}

final class MoveToHomeEvent extends HomeEvent {
  const MoveToHomeEvent();
}