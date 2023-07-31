import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'models/color_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorTheme().createSharedPrefObject();
  await ItemData().createSharedPrefObject();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemData>(create: (context) => ItemData()),
    ChangeNotifierProvider<ColorTheme>(create: (context) => ColorTheme())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorTheme>(context, listen: false).LoadThemeFromSharedPref();
    Provider.of<ItemData>(context, listen: false).LoadThemeFromSharedPrefList();
    return MaterialApp(
      theme: Provider.of<ColorTheme>(context).selectedThemeData,
      home: HomePage(),
    );
  }
}
