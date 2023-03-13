import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import './../car_counter.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) async {
      await Future<Void>.delayed(const Duration(seconds: 1));
      emit(const CarLoaded(cars: <Car>[]));
    });
    on<AddCar>((event, emit) {
      if (state is CarLoaded) {
        final state = this.state as CarLoaded;
        emit(
          CarLoaded(
            cars: List.from(state.cars)..add(event.car),
          ),
        );
      }
    });
    on<RemoveCar>((event, emit) {
      if (state is CarLoaded) {
        final state = this.state as CarLoaded;
        emit(
          CarLoaded(
            cars: List.from(state.cars)..remove(event.car),
          ),
        );
      }
    });
  }
}
