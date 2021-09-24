import 'package:flutter/material.dart';
import 'package:shop/screens/addEdit.dart';
import 'package:shop/screens/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Tabs(),
        '/AddEdit': (context) => ADD_EditScreen(),
      },
    );
  }
}
