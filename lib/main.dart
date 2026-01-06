import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/count_provider.dart';
import 'package:provider_mastering/screens/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const Counter(),
      ),
    );
  }
}
