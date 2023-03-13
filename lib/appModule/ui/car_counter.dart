import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Car extends Equatable {
  final String id;
  final String brand;
  final Image image;

  const Car({
    required this.id,
    required this.image,
    required this.brand,
  });

  @override
  List<Object?> get props => [id, brand, image];

  static List<Car> cars = [
    Car(id: "0", image: Image.asset("images/bmw.png"), brand: "BMW"),
    Car(id: "1", image: Image.asset("images/mercedes.png"), brand: "Mercedes"),
    Car(id: "2", image: Image.asset("images/toyota.png"), brand: "Toyota")
  ];
}
