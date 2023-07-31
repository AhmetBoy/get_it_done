import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  static SharedPreferences? sharedPref;
  List<String> itemsAsString = [];

  Future<void> createSharedPrefObject() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPrefList(List<Item> itemss) {
    itemsAsString.clear();
    for (var item in itemss) {
      itemsAsString.add(json.encode(item.toMap()));
    }
    sharedPref?.setStringList("listData", itemsAsString);
  }

  void LoadThemeFromSharedPrefList() {
    _items.clear();
    List<String> tempList = sharedPref?.getStringList("listData") ?? [];
    for (var item in tempList) {
      var value = Item.fromMap(json.decode(item));
      _items.add(value);
    }
  }

  void toggleStatus(index) {
    items[index].toggleStatus();
    saveThemeToSharedPrefList(items);
    notifyListeners();
  }

  void newAdd(String title, bool isDone) {
    _items.add(Item(title: title, isDone: isDone));
    saveThemeToSharedPrefList(items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveThemeToSharedPrefList(items);
    notifyListeners();
  }
}
