import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformTextField extends PlatformWidget<CupertinoTextField, TextField> {
  final TextEditingController controller;
  final String hintText;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  PlatformTextField({
    this.controller,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
  });

  @override
  TextField createAndroidWidget(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        filled: true,
        isDense: true,
        border: UnderlineInputBorder(),
      ),
      textAlign: textAlign,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: hintText,
      textAlign: textAlign,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}
