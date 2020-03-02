import 'package:flutter/material.dart';
import 'package:numerical_methods/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Numerical Methods',
      theme: ThemeData(
        // brightness: Brightness.dark,
        // canvasColor: Colors.black,
        primarySwatch: Colors.teal,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        canvasColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
