import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numerical_methods/calculator.dart';
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
    Calculator.calculate(
        'cos(x)*cos(x)+sin(x)*sin(x)', {'x': pi / 5, 'cos': cos, 'sin': sin});
    return Scaffold(
      appBar: AppBar(
        title: Text(_method.name),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.calculator),
            onPressed: () {},
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira a função f(x)',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'A',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey,
                      width: double.infinity,
                      height: 1,
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'B',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
