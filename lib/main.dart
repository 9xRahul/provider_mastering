import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/count_provider.dart';
import 'package:provider_mastering/provider/fav_provider.dart';
import 'package:provider_mastering/provider/slider_provider.dart';
import 'package:provider_mastering/screens/counter.dart';
import 'package:provider_mastering/screens/favourite/item_list_screen.dart';
import 'package:provider_mastering/screens/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const ItemListScreen(),
      ),
    );
  }
}
