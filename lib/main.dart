import 'package:flutter/material.dart';
 import 'package:flutter_firebase_news_app/feature/home/home_view.dart';
import 'package:flutter_firebase_news_app/product/initialize/app_theme.dart';
import 'package:flutter_firebase_news_app/product/initialize/application_start.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomAppTheme().theme,
      home: const HomeView(),
    );
  }
}
