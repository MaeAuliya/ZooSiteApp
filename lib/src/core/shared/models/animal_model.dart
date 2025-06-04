import '../entities/animal.dart';

class CoreAnimalModel extends CoreAnimal {
  const CoreAnimalModel({
    required super.name,
    required super.scienceName,
    required super.uniqueFact,
    required super.image,
    required super.description,
  });

  const CoreAnimalModel.empty()
      : super(
          name: '',
          scienceName: '',
          uniqueFact: '',
          image: '',
          description: '',
        );

  CoreAnimalModel.fromEntity(CoreAnimal entity)
      : super(
          name: entity.name,
          scienceName: entity.scienceName,
          uniqueFact: entity.uniqueFact,
          image: entity.image,
          description: entity.description,
        );
}
