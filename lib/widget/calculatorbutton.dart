import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed(widget.text);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 35.0, color: Colors.black),
              ),
            ),
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }
}