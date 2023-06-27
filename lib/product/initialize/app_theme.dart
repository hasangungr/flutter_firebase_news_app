import 'package:flutter/material.dart';
 
@immutable
class CustomAppTheme {
  ThemeData get theme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(12),
            ),
          ),
        ),
      );
}
