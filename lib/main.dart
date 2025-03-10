import 'package:flutter/material.dart';
import 'package:journal_app/locator.dart';
import 'package:journal_app/ui/presentation/widgets/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  configDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashPage(title: 'Journal App'),
    );
  }
}
