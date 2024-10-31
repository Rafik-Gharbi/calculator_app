// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:ieee_workshop_session2/main.dart';

void main() {
  test('Calculator addition', () {
    final calculator = Calculator();

    calculator.buttonPressed('2');
    calculator.buttonPressed('+');
    calculator.buttonPressed('2');
    calculator.buttonPressed('=');

    expect(calculator.result, '4.0');
  });
  test('Calculator substruction', () {
    final calculator = Calculator();

    calculator.buttonPressed('4');
    calculator.buttonPressed('-');
    calculator.buttonPressed('2');
    calculator.buttonPressed('=');

    expect(calculator.result, '2.0');
  });
  test('Calculator multiply', () {
    final calculator = Calculator();

    calculator.buttonPressed('4');
    calculator.buttonPressed('x');
    calculator.buttonPressed('2');
    calculator.buttonPressed('=');

    expect(calculator.result, '8.0');
  });
  test('Calculator division', () {
    final calculator = Calculator();

    calculator.buttonPressed('4');
    calculator.buttonPressed('÷');
    calculator.buttonPressed('2');
    calculator.buttonPressed('=');

    expect(calculator.result, '2.0');
  });
  test('Calculator delete a character', () {
    final calculator = Calculator();

    calculator.buttonPressed('4');
    calculator.buttonPressed('2');
    calculator.buttonPressed('⌫');

    expect(calculator.equation, '4');
  });
  test('Calculator clear expression', () {
    final calculator = Calculator();

    calculator.buttonPressed('4');
    calculator.buttonPressed('x');
    calculator.buttonPressed('2');
    calculator.buttonPressed('=');
    calculator.buttonPressed('C');

    expect(calculator.result, '');
    expect(calculator.equation, '');
  });
}
