import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubitState/counter_cubit.dart';

class BlocCounter extends StatelessWidget {
  BlocCounter({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of<Counter>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<Counter, dynamic>(
              listenWhen: (previous, current) {
                if (current % 2 == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 1) ,content: Text("Genap")));
              },
              buildWhen: (previous, current) {
                if (current > 5) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return Text("Current: $state", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w300),);
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => counter.decrementData(),
                    icon: const Icon(
                      Icons.remove_circle,
                      size: 35,
                    )),
                IconButton(
                    onPressed: () => counter.incrementData(),
                    icon: const Icon(
                      Icons.add_circle,
                      size: 35,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
