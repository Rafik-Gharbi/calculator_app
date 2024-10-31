import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  Calculator calculator = Calculator();

  Widget buildCell(Color color, String value, {double heightFactor = 1}) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      color: color.withOpacity(0.9),
      onPressed: () => calculator.buttonPressed(value),
      child: SizedBox(
        height: 90 * heightFactor,
        child: Center(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 32))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: sizeWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
              child: Text(calculator.equation, style: TextStyle(fontSize: calculator.isResultFocus ? 32 : 42)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  calculator.result,
                  style: TextStyle(fontSize: calculator.isResultFocus ? 42 : 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(
                        children: [
                          buildCell(Colors.red, 'C'),
                          buildCell(Colors.blue, '⌫'),
                          buildCell(Colors.blue, '÷'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.grey, '7'),
                          buildCell(Colors.grey, '8'),
                          buildCell(Colors.grey, '9'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.grey, '4'),
                          buildCell(Colors.grey, '5'),
                          buildCell(Colors.grey, '6'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.grey, '1'),
                          buildCell(Colors.grey, '2'),
                          buildCell(Colors.grey, '3'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.grey, '.'),
                          buildCell(Colors.grey, '0'),
                          buildCell(Colors.grey, '00'),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(
                        children: [
                          buildCell(Colors.blue, 'x'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.blue, '-'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.blue, '+'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildCell(Colors.red, '=', heightFactor: 2),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Calculator {
  String equation;
  String result;
  bool isResultFocus;

  Calculator({this.equation = '', this.result = '', this.isResultFocus = false});

  void buttonPressed(String buttonString) {
    isResultFocus = false;
    switch (buttonString) {
      case 'C':
        equation = '';
        result = '';
        break;
      case '⌫':
        if (equation.isNotEmpty) equation = equation.substring(0, equation.length - 1);
        break;
      case '=':
        try {
          Parser p = Parser();
          final mathExpression = equation.replaceAll('÷', '/').replaceAll('x', '*');
          Expression exp = p.parse(mathExpression);
          result = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
          isResultFocus = true;
        } catch (e) {
          result = 'Error';
          debugPrint(e.toString());
        }
        break;
      default:
        equation = equation + buttonString;
    }
  }
}
