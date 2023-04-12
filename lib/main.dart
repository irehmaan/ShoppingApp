import 'package:flutter/material.dart';
import 'package:groceryapp/pages/grocery.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: ShoppingApp(), // home: SafeArea(child: Text("Hello")),
  ));
}
