import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_test/sum_calculator/sum_calculator.dart';

class SampleTestApp extends StatelessWidget {
  const SampleTestApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CalculatorCubit(),
        child: const MaterialApp(
          home: MainPage(),
        ));
  }
}
