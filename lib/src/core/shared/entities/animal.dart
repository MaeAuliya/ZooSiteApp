import 'package:equatable/equatable.dart';

class CoreAnimal extends Equatable {
  final String name;
  final String scienceName;
  final String uniqueFact;
  final String image;
  final String description;

  const CoreAnimal({
    required this.name,
    required this.scienceName,
    required this.uniqueFact,
    required this.image,
    required this.description,
  });

  @override
  List<Object?> get props => [
    name,
    scienceName,
    uniqueFact,
    image,
    description,
  ];
}
