import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///MyApp class
class MyApp extends StatelessWidget {
  ///MyApp class
  const MyApp({super.key});
  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(),
      );
}
