import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_test/config/colors.dart';
import 'package:sample_test/config/sizes.dart';
import 'package:sample_test/sum_calculator/sum_calculator.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorPrimary,
        body: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Center(
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      width: kScreenWidth(context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kColorTextInputBg,
                      ),
                      child: BlocBuilder<CalculatorCubit, double>(
                        builder: (context, state) => Text(
                          "Sum: $state",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Spacer(),
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Back"),
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
