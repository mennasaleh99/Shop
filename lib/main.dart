import 'package:flutter/material.dart';
import 'package:shop/provider/product.dart';
import 'package:shop/screens/addEdit.dart';
import 'package:shop/screens/tabs.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
        routes: {
          '/': (context) => Tabs(),
          '/AddEdit': (context) => ADDEditScreen(),
        },
      ),
    );
  }
}
