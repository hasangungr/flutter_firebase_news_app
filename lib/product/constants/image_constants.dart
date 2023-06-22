import 'package:flutter/material.dart';

@immutable //No variable defining
class ImageConstants {
  const ImageConstants._();

  static String microphone = 'icon_mic.png'.iconToPng;
}

extension _StringPath on String {
  String get iconToPng => 'assets/icon$this.png';
}
