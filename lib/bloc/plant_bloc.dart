import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:froti/models/Models.dart';
import 'package:froti/services/Services.dart';

part 'plant_event.dart';
part 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  PlantBloc() : super(PlantInitial());

  @override
  Stream<PlantState> mapEventToState(
    PlantEvent event,
  ) async* {
    if (event is FetchPlants) {
      List<Plant> plant = await PlantServices.getPlantData();
      yield PlantLoaded(plant);
    }
  }
}
