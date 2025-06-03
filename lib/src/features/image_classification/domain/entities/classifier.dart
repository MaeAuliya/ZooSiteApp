import 'package:equatable/equatable.dart';
import 'package:tflite_flutter/tflite_flutter.dart';


class Classifier extends Equatable {
  const Classifier({
    required this.interpreter,
    required this.inputShape,
    required this.outputShape,
    required this.inputType,
    required this.outputType,
  });
  final Interpreter interpreter;
  final List<int> inputShape;
  final List<int> outputShape;
  final TensorType inputType;
  final TensorType outputType;

  @override
  List<Object?> get props => [
    interpreter,
    inputShape,
    outputShape,
    inputType,
    outputType,
  ];
}