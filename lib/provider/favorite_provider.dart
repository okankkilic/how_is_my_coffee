import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;

  //UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void toggleFavorite(int id, Item item) {
    final isExist = _items.contains(item);
    if (isExist) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  bool isExist(int id, Item item) {
    final isExist = _items.contains(item);
    return isExist;
  }

  void addItem(int id, Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int id, Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

class Item {
  final int id;
  final String name;
  final String desc;

  Item({required this.id, required this.name, required this.desc});
}
