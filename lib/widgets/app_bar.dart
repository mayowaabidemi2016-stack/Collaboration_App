import 'package:flutter/material.dart';
import 'package:collaboration/utils/app_color.dart';

class AppBarText extends StatelessWidget {
  final String text;

  final double size;

  const AppBarText({super.key, required this.text, this.size = 26});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.mainColor,

      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
