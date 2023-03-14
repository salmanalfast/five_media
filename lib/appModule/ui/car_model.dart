import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Car extends Equatable {
  final String brand;
  final String id;
  final Image image;

  const Car({
    required this.brand,
    required this.id,
    required this.image,
  });

  @override
  List<Object?> get props => [brand, id, image];

  static List<Car> cars = [
    Car(brand: "BMW", id: "0", image: Image.asset("images/bmw.png")),
    Car(brand: "Mercedes", id: "1", image: Image.asset("images/mercedes.png")),
    Car(brand: "Toyota", id: "2", image: Image.asset("images/toyota.png"))
  ];
}
