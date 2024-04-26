
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/calculatorbutton.dart';
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "";
  int number1 = 0;
  int number2 = 0;
  String result = '';
  String opp = '';


  void buttonClick(String button) {
    if (button == 'c') {
      result = '';
      output = '';
      number1 = 0;
      number2 = 0;
    } else
    if (button == '+' || button == '-' || button == '*' || button == '/') {
      if (output.isNotEmpty) {
        number1 = int.parse(output);
        output = '$number1 $button ';
        opp = button;
      }
    } else if (button == '=') {
      if (output.isNotEmpty && opp.isNotEmpty) {
        List values = output.split(' ');
        if (values.length == 3) {
          number2 = int.parse(values[2]);
          output = '$number1 $opp $number2 = ';
          if (opp == '+') {
            result = (number1 + number2).toString();
          }
          if (opp == '-') {
            result = (number1 - number2).toString();
          }
          if (opp == '*') {
            result = (number1 * number2).toString();
          }
          if (opp == '/') {
            result = (number1 ~/ number2).toString();
          }
          output = result;
        }
      }
    } else {
      output += button;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.blue.shade200,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.bottomRight,
                widthFactor: 100.0,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    output,
                    style:
                    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              color: Colors.white70,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: 'c',
                        color: Colors.grey.shade200,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '+/-',
                        color: Colors.grey.shade200,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '%',
                        color: Colors.grey.shade200,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '/',
                        color: Colors.grey.shade200,
                        onPressed: buttonClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '7',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '8',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '9',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '*',
                        color: Colors.blue.shade200,
                        onPressed: buttonClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '4',
                        color: Colors.white,
                        onPressed: (_) => buttonClick("7"),
                      ),
                      CalculatorButton(
                        text: '5',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '6',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '-',
                        color: Colors.blue.shade200,
                        onPressed: buttonClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '1',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '2',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '3',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '+',
                        color: Colors.blue.shade200,
                        onPressed: buttonClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '.',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '0',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '*',
                        color: Colors.white,
                        onPressed: buttonClick,
                      ),
                      CalculatorButton(
                        text: '=',
                        color: Colors.blue.shade200,
                        onPressed: buttonClick,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}