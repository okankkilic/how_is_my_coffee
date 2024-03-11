import 'dart:collection';

import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

class Item {
  final String name;
  final String desc;

  Item(this.name, this.desc);
}
