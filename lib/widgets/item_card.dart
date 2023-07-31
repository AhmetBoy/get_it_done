import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Item_Card extends StatelessWidget {
  final String? title;
  final bool? isDone;
  final Function(bool?)? toogleStatus;
  final Function(DismissDirection)? deleteItem;
  Item_Card({this.title, this.isDone, this.toogleStatus, this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deleteItem,
      dragStartBehavior: DragStartBehavior.down,
      background: Icon(Icons.add),
      key: Key(title.toString()),
      child: Card(
        color: isDone == true ? Colors.blue.shade50 : Colors.white,
        elevation: isDone == true ? 10 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        child: ListTile(
            title: Text("$title",
                style: TextStyle(color: Theme.of(context).primaryColor)),
            trailing: Checkbox(
              value: isDone,
              onChanged: toogleStatus,
            )),
      ),
    );
  }
}
