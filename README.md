# Simple Calculator

This is a sample calculator app that calculates the sum of number between two integers excluding the borders.

## Project structure

The application uses a feature-driven directory structure. This project structure enables us to scale the project by having self-contained features. In this example we will only have a single feature (the sum calculator itself) but in more complex applications we can have hundreds of different features.

## State management

I have used the block state management, and a calculator cubit to calculate the sum.

## Input filtering

To filter the entered textes are only numbers I have used FilteringTextInputFormatter with regex, and implemented length limit to controll the size of entered texts and also I have implemented a logic on the onChanged function of the text fields to check if the entered values can be parsed to integer.

## Testing

I have used flutter_test and bloc_test libraries to test the CalculatorCubit.
