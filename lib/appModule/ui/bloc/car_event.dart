part of 'car_bloc.dart';

abstract class CarEvent extends Equatable {
  const CarEvent();

  @override
  List<Object> get props => [];
}

class LoadCarCounter extends CarEvent {}

class AddCar extends CarEvent {
  final Car car;

  const AddCar(this.car);

  @override
  List<Object> get props => [car];
}

class RemoveCar extends CarEvent{
  final Car car;

  const RemoveCar(this.car);

  @override
  List<Object> get props => [car];
}
