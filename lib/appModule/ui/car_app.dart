import 'package:five_media/appModule/ui/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarCounterClass extends StatelessWidget {
  const CarCounterClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()..add(LoadCarCounter()))
      ],
      child: MaterialApp());
  }
}
