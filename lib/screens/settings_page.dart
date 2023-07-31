import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/color_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings Page")),
      body: SwitchWidget(),
    );
  }
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool colorValue = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Color Theme"),
      subtitle: Text(colorValue == true ? "Green" : "Orange"),
      value: Provider.of<ColorTheme>(context).isGreen,
      onChanged: (value) {
        setState(() {
          colorValue = value;
        });
        Provider.of<ColorTheme>(context, listen: false).switchTheme(colorValue);
      },
    );
  }
}
