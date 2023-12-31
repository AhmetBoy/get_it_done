class Item {
  String? title;
  bool isDone;
  Item({this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }

  Item.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        isDone = map["isDone"];

  Map<String, dynamic> toMap() => {"title": title, "isDone": isDone};
}
