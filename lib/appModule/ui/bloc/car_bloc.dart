import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import './../car_model.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc() : super(CarInitial()) {
    on<LoadCarCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      emit(const CarLoaded(cars: <Car>[]));
    });
    on<AddCar>((event, emit) {
      if (state is CarLoaded) {
        final state = this.state as CarLoaded;
        emit(
          CarLoaded(cars: List.from(state.cars)..add(event.car))
        );
      }
    });
    on<RemoveCar>((event, emit) {
      if (state is CarLoaded) {
        final state = this.state as CarLoaded;
        emit(
          CarLoaded(cars: List.from(state.cars)..remove(event.car))
        );
      }
    });
  }
}
