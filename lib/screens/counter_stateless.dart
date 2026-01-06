import 'package:flutter/material.dart';

class CounterStateless extends StatelessWidget {
  const CounterStateless({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> _counter = ValueNotifier<int>(0);
    ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _isObscure,
            builder: (context, value, child) {
              return TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  suffix: InkWell(
                    onTap: () {
                      if (_isObscure.value) {
                        _isObscure.value = false;
                      } else {
                        _isObscure.value = true;
                      }
                    },
                    child: Icon(
                      _isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: _isObscure.value,
              );
            },
          ),

          ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                _counter.value.toString(),
                style: TextStyle(fontSize: 30),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
      ),
    );
  }
}
