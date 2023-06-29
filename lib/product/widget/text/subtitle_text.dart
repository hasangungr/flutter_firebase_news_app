import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({required this.title, super.key, this.color, this.fontSize});
  final String title;
  final Color? color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(

      title,
      style: context.general.textTheme.titleMedium?.copyWith(
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
