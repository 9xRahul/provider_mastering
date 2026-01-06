import 'package:flutter/widgets.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favouriteList = [];
  List<int> get favouriteList => _favouriteList;

  void removeFav(int index) {
    favouriteList.remove(index);
    notifyListeners();
  }

  void addFav(int index) {
    favouriteList.add(index);
    notifyListeners();
  }
}
