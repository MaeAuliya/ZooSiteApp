import '../../domain/entities/classification_animal.dart';

class ClassificationAnimalModel extends ClassificationAnimal {
  const ClassificationAnimalModel({
    required super.name,
    required super.scienceName,
    required super.uniqueFact,
    required super.image,
    required super.description,
    required super.computeTime,
    required super.accuration,
  });

  ClassificationAnimalModel.fromEntity(ClassificationAnimal entity)
      : super(
          name: entity.name,
          scienceName: entity.scienceName,
          uniqueFact: entity.uniqueFact,
          image: entity.image,
          description: entity.description,
          computeTime: entity.computeTime,
          accuration: entity.accuration,
        );
}
