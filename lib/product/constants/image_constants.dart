import 'package:flutter/material.dart';

enum ImageConstants {
  microphone('mic'),
  appIcon('app_logo');

  final String value;

  // ignore: sort_constructors_first
  const ImageConstants(this.value);

  String get toPng => 'assets/icons/icon_$value.png';
  Image get toImage => Image.asset(toPng);
}
