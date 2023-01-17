import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<double> {
  CalculatorCubit() : super(0);

  void calculateSumsInRange(int firstNumber, int secondNumber) {
    double sum = 0;
    if (firstNumber < secondNumber) {
      sum =
          ((secondNumber - firstNumber + 1) * (firstNumber + secondNumber)) / 2;
      sum = sum - (firstNumber + secondNumber);
    }
    emit(sum.roundToDouble());
  }
}
