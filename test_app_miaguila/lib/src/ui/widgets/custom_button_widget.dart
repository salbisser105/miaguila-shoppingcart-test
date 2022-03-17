import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      this.color = Colors.blue})
      : super(key: key);
  final String text;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(100), color: color),
      child: Text(
        
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
