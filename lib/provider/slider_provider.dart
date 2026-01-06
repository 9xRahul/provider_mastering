import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _sliderValue = .5;
  double get sliderValue => _sliderValue;

  void changeSliderValue(double val) {
    _sliderValue = val;
     notifyListeners();
    
  }
}
