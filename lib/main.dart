import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/auth_provider.dart';
import 'package:provider_mastering/provider/count_provider.dart';
import 'package:provider_mastering/provider/fav_provider.dart';
import 'package:provider_mastering/provider/slider_provider.dart';
import 'package:provider_mastering/provider/theme_change.dart';
import 'package:provider_mastering/screens/auth_scree.dart';
import 'package:provider_mastering/screens/counter.dart';
import 'package:provider_mastering/screens/counter_stateless.dart';
import 'package:provider_mastering/screens/dart_theme.dart';
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
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],

      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(color: Colors.blue),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(color: Colors.red),
            ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
