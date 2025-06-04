part of 'classification_bloc.dart';

abstract class ClassificationState extends Equatable {
  const ClassificationState();

  @override
  List<Object?> get props => [];
}

final class ClassificationInitial extends ClassificationState {
  const ClassificationInitial();
}

final class ClassificationLoading extends ClassificationState {
  const ClassificationLoading();
}

final class TakeImageSuccess extends ClassificationState {
  final String image;

  const TakeImageSuccess(this.image);

  @override
  List<Object?> get props => [image];
}

final class TakeImageFailed extends ClassificationState {
  const TakeImageFailed();
}

final class TakeImageError extends ClassificationState {
  final String errorMessage;

  const TakeImageError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ClassifyImageSuccess extends ClassificationState {
  final ClassificationAnimal animal;

  const ClassifyImageSuccess(this.animal);

  @override
  List<Object?> get props => [animal];
}

final class ClassifyImageLoading extends ClassificationState {
  const ClassifyImageLoading();
}

final class ClassifyImageError extends ClassificationState {
  final String errorMessage;

  const ClassifyImageError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class ShowModelBottomSheetSuccess extends ClassificationState {
  const ShowModelBottomSheetSuccess();
}

final class ChangeModelSuccess extends ClassificationState {
  final ClassificationModelType currentModel;

  const ChangeModelSuccess(this.currentModel);

  @override
  List<Object?> get props => [currentModel];
}