part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
  
  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CarLoaded extends CounterState{
  final List<Car> cars;

  const CarLoaded({required this.cars});
  
  @override
  List<Object> get props => [cars];
}
