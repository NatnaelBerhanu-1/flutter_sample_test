import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_test/config/colors.dart';
import 'package:sample_test/sum_calculator/pages/result_page.dart';
import 'package:sample_test/sum_calculator/sum_calculator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _firstNumberController = TextEditingController(text: "0");
  final _secondNumberController = TextEditingController(text: "1");
  bool isRangeValid = true;
  @override
  void initState() {
    _firstNumberController.addListener(rangeValidator);
    _secondNumberController.addListener(rangeValidator);
    super.initState();
  }

  rangeValidator() {
    if ((int.tryParse(_firstNumberController.text) ?? 0) <
        (int.tryParse(_secondNumberController.text) ?? 0)) {
      setState(() {
        isRangeValid = true;
      });
    } else {
      setState(() {
        isRangeValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorPrimary,
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: Form(
              child: Column(
            children: [
              _textInputArea("First number", _firstNumberController),
              SizedBox(
                height: 20,
              ),
              _textInputArea("Second number", _secondNumberController),
              Spacer(),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        } else {
                          return kColorAccent;
                        }
                      }),
                      fixedSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width, 50))),
                  onPressed: (int.tryParse(_firstNumberController.text) ?? 0) <
                          (int.tryParse(_secondNumberController.text) ?? 1)
                      ? () {
                          BlocProvider.of<CalculatorCubit>(context)
                              .calculateSumsInRange(
                                  int.tryParse(_firstNumberController.text) ??
                                      0,
                                  int.tryParse(_secondNumberController.text) ??
                                      1);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultPage()));
                        }
                      : null,
                  child: Text("Calculate sum")),
              SizedBox(
                height: 10,
              )
            ],
          )),
        ),
      ),
    );
  }

  DecoratedBox _textInputArea(String label, TextEditingController controller) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: kColorPrimaryLight,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: kColorTextInputBg),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.white,
                maxLength: 10,
                onChanged: (value) {
                  log(value);
                  int? newVal = int.tryParse(
                    value,
                  );
                  log(newVal.toString());
                  if (newVal != null) {
                    controller.value = TextEditingValue(
                        text: newVal.toString(),
                        selection: TextSelection.collapsed(
                            offset: newVal.toString().length));
                  } else {
                    controller.value = TextEditingValue(
                        text: "0",
                        selection: TextSelection.collapsed(offset: 1));
                  }
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
