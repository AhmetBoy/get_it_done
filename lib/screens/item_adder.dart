import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final TextEditingController? textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  maxLines: 2,
                  controller: textController,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      labelText: "Add Item",
                      hintText: "...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  autofocus: true,
                  style: TextStyle(fontSize: 20)),
            ),
            FilledButton(
                onPressed: () {
                  Provider.of<ItemData>(context, listen: false)
                      .newAdd(textController!.text, false);

                  Navigator.pop(context);
                },
                child: Text("ADD"))
          ],
        ),
      ),
    );
  }
}
