// calculator_page.dart

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _input = '';

  void _onNumberButtonPressed(String number) {
    setState(() {
      _input += number;
    });
  }

  void _onOperatorButtonPressed(String operator) {
    setState(() {
      _input += operator;
    });
  }

  void _onEqualsButtonPressed() {
    try {
      // Evaluate the input expression and update the result
      Parser parser = Parser();
      Expression expression = parser.parse(_input);
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        _input = result.toString();
      });
    } catch (e) {
      // Handle any errors that occur during evaluation
      setState(() {
        _input = 'Error';
      });
    }
  }

  void _onClearButtonPressed() {
    setState(() {
      _input = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _input,
                style: const TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
              _buildOperatorButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
              _buildOperatorButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
              _buildOperatorButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('0'),
              _buildOperatorButton('/'),
              _buildEqualsButton(),
              _buildClearButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return ElevatedButton(
      onPressed: () => _onNumberButtonPressed(number),
      child: Text(number),
    );
  }

  Widget _buildOperatorButton(String operator) {
    return ElevatedButton(
      onPressed: () => _onOperatorButtonPressed(operator),
      child: Text(operator),
    );
  }

  Widget _buildEqualsButton() {
    return ElevatedButton(
      onPressed: _onEqualsButtonPressed,
      child: const Text('='),
    );
  }

  Widget _buildClearButton() {
    return ElevatedButton(
      onPressed: _onClearButtonPressed,
      child: const Text('C'),
    );
  }
}
