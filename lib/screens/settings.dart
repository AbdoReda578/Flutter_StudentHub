import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool)? onThemeChanged;

  const SettingsScreen({super.key, this.onThemeChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SwitchListTile(
        value: _isDark,
        title: const Text("Dark Mode"),
        secondary: const Icon(Icons.dark_mode),
        onChanged: (bool value) {
          setState(() {
            _isDark = value;
          });
          // Update the app theme
          widget.onThemeChanged?.call(value);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Theme: ${_isDark ? 'Dark' : 'Light'}")),
          );
        },
      ),
    );
  }
}