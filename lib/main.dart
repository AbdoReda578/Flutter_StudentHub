import 'package:flutter/material.dart';
import 'package:studenthub/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Hub',
      theme: ThemeData(primarySwatch: Colors.indigo),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: HomeScreen(onThemeChanged: _toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}