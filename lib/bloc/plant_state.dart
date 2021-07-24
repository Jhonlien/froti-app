part of 'plant_bloc.dart';

abstract class PlantState extends Equatable {
  const PlantState();
}

class PlantInitial extends PlantState {
  @override
  List<Object> get props => [];
}

class PlantLoaded extends PlantState {
  final List<Plant> plants;
  PlantLoaded(this.plants);
  @override
  List<Object> get props => [plants];
}
