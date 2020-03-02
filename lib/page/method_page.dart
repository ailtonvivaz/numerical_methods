import 'package:flutter/material.dart';
import 'package:numerical_methods/model/method.dart';

class MethodPage extends StatefulWidget {
  final Method method;

  MethodPage(this.method);

  @override
  _MethodPageState createState() => _MethodPageState();
}

class _MethodPageState extends State<MethodPage> {
  Method get _method => widget.method;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_method.name)),
      body: Center(
        child: Text(_method.name),
      ),
    );
  }
}
