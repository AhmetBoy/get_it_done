import 'package:flutter/material.dart';
import 'package:get_it_done/screens/settings_page.dart';
import 'package:provider/provider.dart';

import '../models/items_data.dart';
import '../widgets/item_card.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get It Done"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: Text("${Provider.of<ItemData>(context).items.length} Items",
                style: Theme.of(context).textTheme.headline3),
          ),
        ),
        Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Consumer<ItemData>(
                  builder: (context, itemData, child) => ListView.builder(
                    itemCount: itemData.items.length,
                    itemBuilder: (context, index) {
                      return Item_Card(
                        title: itemData.items[index].title,
                        isDone: itemData.items[index].isDone,
                        toogleStatus: (_) {
                          itemData.toggleStatus(index);
                        },
                        deleteItem: (_) {
                          itemData.deleteItem(index);
                        },
                      );
                    },
                  ),
                ),
              ),
            ))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ItemAdder(),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
