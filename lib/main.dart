import 'package:flutter/material.dart';
import 'package:aliment/routes/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formation Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generatorRoute(settings),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ));
  }
}
