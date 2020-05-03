import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerical_methods/calculator.dart';
import 'package:numerical_methods/model/method.dart';
import 'package:numerical_methods/widget/custom_slider_thumb_circle.dart';
import 'package:numerical_methods/widget/platform/platform_app_bar.dart';
import 'package:numerical_methods/widget/platform/platform_button.dart';
import 'package:numerical_methods/widget/platform/platform_card.dart';
import 'package:numerical_methods/widget/platform/platform_icon_button.dart';
import 'package:numerical_methods/widget/platform/platform_scaffold.dart';
import 'package:numerical_methods/widget/platform/platform_spinner.dart';
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

  double _precision = 3;
  CalculatorState _calculatorState = CalculatorState.none;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(_method.name),
        actions: <Widget>[
          _calculatorState == CalculatorState.calculated
              ? PlatformIconButton(
                  onPressed: _onClickRefresh,
                  icon: Icon(Icons.refresh),
                )
              : Container(),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: _buildBody(),
      ),
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
                  PlatformTextField(
                    controller: _functionController,
                    hintText: 'Função',
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: <Widget>[
                      Text("Casas Decimais"),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: CustomSliderThumbCircle(
                              thumbRadius: 15, min: 1, max: 6),
                        ),
                        child: Slider(
                          value: _precision,
                          divisions: 5,
                          min: 1,
                          max: 6,
                          onChanged: (value) {
                            setState(() {
                              _precision = value;
                            });
                          },
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
                          color: Theme.of(context).dividerColor,
                          width: double.infinity,
                          height: 2,
                          // child: Divider(),
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
                  _buildResult(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResult() {
    switch (_calculatorState) {
      case CalculatorState.none:
        return PlatformButton(
          title: 'Calcular',
          onPressed: _onClickCalculate,
        );
        break;
      case CalculatorState.calculating:
        return PlatformSpinner();
      case CalculatorState.calculated:
        return Column(
          children: <Widget>[
            Divider(height: 40),
            PlatformCard(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'f(0) = 0.6546345',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
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
        );
      default:
    }
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

  _onClickCalculate() {
    FocusScope.of(context).unfocus();

    setState(() {
      _calculatorState = CalculatorState.calculating;
    });

    final function = _functionController.text;

    Calculator.calculate('function', {'x': pi / 5, 'cos': cos, 'sin': sin});

    print(function);

    Timer(Duration(seconds: 2), () {
      setState(() {
        _calculatorState = CalculatorState.calculated;
      });
    });
  }

  void _onClickRefresh() {
    FocusScope.of(context).unfocus();

    setState(() {
      _calculatorState = CalculatorState.none;
      _precision = 3;
      _functionController.text = "";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _functionController.dispose();
  }
}
