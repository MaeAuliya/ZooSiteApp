part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInit extends HomeState {
  const HomeInit();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class GetAnimalHistoriesSuccess extends HomeState {
  final List<CoreAnimal> histories;

  const GetAnimalHistoriesSuccess({required this.histories});

  @override
  List<Object?> get props => [histories];
}

final class GetAnimalHistoriesError extends HomeState {
  final String errorMessage;

  const GetAnimalHistoriesError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class OpenImageSourceBottomSheetSuccess extends HomeState {
  const OpenImageSourceBottomSheetSuccess();
}

final class OpenDialogOnConstructionSuccess extends HomeState {
  const OpenDialogOnConstructionSuccess();
}