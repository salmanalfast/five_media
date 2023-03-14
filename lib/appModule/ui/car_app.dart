import 'dart:math';

import 'package:five_media/appModule/ui/bloc/car_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarCounterClass extends StatelessWidget {
  const CarCounterClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CarBloc()..add(LoadCarCounter()))
        ],
        child: Scaffold(
          body: Center(
            child: BlocBuilder<CarBloc, CarState>(
              builder: (context, state) {
                if (state is CarInitial) {
                  return const CircularProgressIndicator(
                    color: Colors.cyan,
                  );
                }
                if (state is CarLoaded) {
                  return Column(
                    children: [
                      Text(
                        "${state.cars.length}",
                        style: const TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            for (int index = 0;
                                index < state.cars.length;
                                index++)
                              Positioned(
                                top: random.nextInt(250).toDouble(),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: state.cars[index].image,
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return const Text("Something Went Wrong");
                }
                ;
              },
            ),
          ),
        ));
  }
}
