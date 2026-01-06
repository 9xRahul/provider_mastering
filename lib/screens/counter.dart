import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/count_provider.dart';
import 'package:provider_mastering/provider/theme_change.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    final themeChange = Provider.of<ThemeChanger>(context);
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        actions: [
          GestureDetector(
            onTap: () {
              if (themeChange.themeMode == ThemeMode.light) {
                themeChange.setTheme(ThemeMode.dark);
              } else {
                themeChange.setTheme(ThemeMode.light);
              }
            },
            child: Icon(
              themeChange.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
        ],
      ),
      body: Center(
        child: Consumer<CountProvider>(
          builder: (context, value, child) {
            return Text(value.count.toString(), style: TextStyle(fontSize: 50));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
