import 'dart:convert';

main() {
  Item itemObject = Item(title: "uyu", isDone: true);
  print("itemObject=$itemObject");
  print("itemObjectType=${itemObject.runtimeType}");

  Map itemAsMap = itemObject.toMap();
  print("itemAsMap=$itemAsMap");
  print("itemAsMapType=${itemAsMap.runtimeType}");

  String itemAsJson = json.encode(itemAsMap);
  print("itemAsJson=$itemAsJson");
  print("itemAsJsonType=${itemAsJson.runtimeType}");
}

class Item {
  String? title;
  bool? isDone;

  Item({this.title, this.isDone});

  Map<String, dynamic> toMap() => {"title": title, "isDone": isDone};
}
