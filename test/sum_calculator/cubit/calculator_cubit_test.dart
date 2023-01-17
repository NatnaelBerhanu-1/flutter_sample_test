import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_test/sum_calculator/cubit/calculator_cubit.dart';

void main() {
  group("CalculatorBloc", () {
    late CalculatorCubit calculatorCubit;
    setUp(() {
      calculatorCubit = CalculatorCubit();
    });

    test('initial state is 0', () {
      expect(calculatorCubit.state, 0);
    });

    blocTest('emits 0 if firstNumber greater than Second number ',
      build: ()=>calculatorCubit,
      act: (bloc) => bloc.calculateSumsInRange(10, 0),
      expect: () => [0]
    );

    blocTest('emits 0 if firstNumber equal to Second number ',
      build: ()=>calculatorCubit,
      act: (bloc) => bloc.calculateSumsInRange(0, 0),
      expect: () => [0]
    );

    blocTest('emits correct value if firstNumber is less than Second number ',
      build: ()=>calculatorCubit,
      act: (bloc) => bloc.calculateSumsInRange(0, 10),
      expect: () => [45]
    );
    blocTest('emits correct value if firstNumber is less than Second number ',
      build: ()=>calculatorCubit,
      act: (bloc) => bloc.calculateSumsInRange(0, 3),
      expect: () => [3]
    );
  });
}
