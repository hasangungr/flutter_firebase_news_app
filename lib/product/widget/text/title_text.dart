import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.general.textTheme.headlineSmall
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
