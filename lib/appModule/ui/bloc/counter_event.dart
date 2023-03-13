part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
} 

class LoadCarCounter extends CounterEvent{}

class AddCar extends CounterEvent{
  final Car car;

  const AddCar(this.car);

  @override
  List<Object> get props => [car];
}

class RemoveCar extends CounterEvent{
  final Car car;
  
  const RemoveCar(this.car);

  @override
  List<Object> get props => [car];
}
