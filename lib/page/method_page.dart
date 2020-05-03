import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerical_methods/calculator.dart';
import 'package:numerical_methods/model/method.dart';
import 'package:numerical_methods/widget/platform/platform_app_bar.dart';
import 'package:numerical_methods/widget/platform/platform_button.dart';
import 'package:numerical_methods/widget/platform/platform_card.dart';
import 'package:numerical_methods/widget/platform/platform_scaffold.dart';
import 'package:numerical_methods/widget/platform/platform_text_field.dart';

class MethodPage extends StatefulWidget {
  final Method method;

  MethodPage(this.method);

  @override
  _MethodPageState createState() => _MethodPageState();
}

class _MethodPageState extends State<MethodPage> {
  Method get _method => widget.method;

  var _functionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(_method.name),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: PlatformTextField(
                          controller: _functionController,
                          hintText: 'Function',
                        ),
                        flex: 3,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: PlatformTextField(
                          hintText: 'Precisão',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: PlatformTextField(
                          hintText: 'a',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
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
                        child: PlatformTextField(
                          hintText: 'b',
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  PlatformButton(
                    title: 'Calcular',
                    onPressed: () {},
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  PlatformCard(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'f(0) = 0.6546345',
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  PlatformCard(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Iterations',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Material(
                              color: Colors.transparent,
                              child: _buildTable(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onClickCalculate() {
    final function = _functionController.text;

    Calculator.calculate('function', {'x': pi / 5, 'cos': cos, 'sin': sin});

    print(function);
  }

  @override
  void dispose() {
    super.dispose();
    _functionController.dispose();
  }

  _buildTable() {
    return DataTable(
      columnSpacing: 50,
      columns: [
        DataColumn(
          label: Text(
            "abcd",
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900),
          ),
          numeric: true,
        ),
        DataColumn(
            label: Text(
          "abcd",
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900),
        )),
        DataColumn(
            label: Text(
          "abcd",
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900),
        )),
        DataColumn(
            label: Text(
          "abcd",
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w900),
        )),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text("1")),
          DataCell(Text("Pavan")),
          DataCell(Text("99")),
          DataCell(Text("99%")),
        ]),
        DataRow(cells: [
          DataCell(Text("2")),
          DataCell(Text("Suraj")),
          DataCell(Text("85")),
          DataCell(Text("87%")),
        ]),
        DataRow(cells: [
          DataCell(Text("3")),
          DataCell(Text("Rajat")),
          DataCell(Text("89")),
          DataCell(Text("89%")),
        ]),
        DataRow(cells: [
          DataCell(Text("4")),
          DataCell(Text("Sanjay")),
          DataCell(Text("75")),
          DataCell(Text("80%")),
        ]),
        DataRow(cells: [
          DataCell(Text("4")),
          DataCell(Text("Sanjay")),
          DataCell(Text("75")),
          DataCell(Text("80%")),
        ]),
        DataRow(cells: [
          DataCell(Text("4")),
          DataCell(Text("Sanjay")),
          DataCell(Text("75")),
          DataCell(Text("80%")),
        ]),
        DataRow(cells: [
          DataCell(Text("4")),
          DataCell(Text("Sanjay")),
          DataCell(Text("75")),
          DataCell(Text("80%")),
        ]),
        DataRow(cells: [
          DataCell(Text("4")),
          DataCell(Text("Sanjay")),
          DataCell(Text("75")),
          DataCell(Text("80%")),
        ]),
      ],
    );
  }
}
