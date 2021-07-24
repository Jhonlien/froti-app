part of 'plant_bloc.dart';

abstract class PlantEvent extends Equatable {
  const PlantEvent();
}

class FetchPlants extends PlantEvent {
  @override
  List<Object> get props => [];
}
