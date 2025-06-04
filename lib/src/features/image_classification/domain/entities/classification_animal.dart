import '../../../../core/shared/entities/animal.dart';

class ClassificationAnimal extends CoreAnimal {
  final double computeTime;
  final double accuration;

  const ClassificationAnimal({
    required super.name,
    required super.scienceName,
    required super.uniqueFact,
    required super.image,
    required super.description,
    required this.computeTime,
    required this.accuration,
  });

  @override
  List<Object?> get props => [
        name,
        scienceName,
        uniqueFact,
        image,
        description,
        computeTime,
        accuration,
      ];
}
