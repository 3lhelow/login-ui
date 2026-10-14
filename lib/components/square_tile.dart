import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onPressed;

  const SquareTile({super.key, required this.imagePath, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,

      padding: EdgeInsets.zero,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(imagePath, height: 40),
      ),
    );
  }
}
