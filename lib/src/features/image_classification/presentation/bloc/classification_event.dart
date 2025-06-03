part of 'classification_bloc.dart';

abstract class ClassificationEvent extends Equatable {
  const ClassificationEvent();

  @override
  List<Object?> get props => [];
}

final class TakeImageEvent extends ClassificationEvent {
  final String source;

  const TakeImageEvent(this.source);

  @override
  List<Object?> get props => [source];
}

final class ClassifyImageEvent extends ClassificationEvent {
  final ImageClassificationParams params;

  const ClassifyImageEvent(this.params);

  @override
  List<Object?> get props => [params];
}

