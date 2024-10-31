import 'package:flutter/material.dart';

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

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  Widget buildCell(Color color, String value, {double heightFactor = 1}) {
    return Container(
      height: 90 * heightFactor,
      decoration: BoxDecoration(color: color),
      child: Center(child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 32))),
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
            const Padding(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: Text('2x4*6-9', style: TextStyle(fontSize: 32)),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10, top: 20),
              child: Text('-24', style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
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
