import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Center(
        child: Text(
            text,
          style: TextStyle(color: Colors.black,
            fontSize: 18,
          )
        ),
      ),

    );
  }
}