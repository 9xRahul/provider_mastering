import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mastering/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Container(
                    color: Colors.redAccent.withOpacity(value.sliderValue),
                    width: 150,
                    height: 300,
                  ),
                  Container(
                    color: Colors.green.withOpacity(value.sliderValue),
                    width: 150,
                    height: 300,
                  ),
                ],
              );
            },
          ),

          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                value: value.sliderValue,
                max: 1,
                min: 0,

                onChanged: (newValue) {
                  value.changeSliderValue(newValue);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
