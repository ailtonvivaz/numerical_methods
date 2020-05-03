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
  final bool autocorrect;

  PlatformTextField({
    this.controller,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.autocorrect = false,
  });

  @override
  TextField createAndroidWidget(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: hintText),
      textAlign: textAlign,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autocorrect: autocorrect,
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      placeholder: hintText,
      textAlign: textAlign,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autocorrect: autocorrect,
    );
  }
}
