import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final int line;
  final TextOverflow overflow;
  final double size;
  final Color? backGround;

  const BigText({
    super.key,
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
    this.line = 1,
    this.backGround,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: line,
      text,
      style: TextStyle(fontSize: size, overflow: overflow),
    );
  }
}
