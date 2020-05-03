import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_app_bar.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformScaffold extends PlatformWidget<Widget, Scaffold> {
  final PlatformAppBar appBar;
  final Widget body;

  PlatformScaffold({this.appBar, this.body});

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: appBar?.build(context),
      body: body,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: CupertinoPageScaffold(
        navigationBar: appBar?.build(context),
        child: body,
      ),
    );
  }
}
