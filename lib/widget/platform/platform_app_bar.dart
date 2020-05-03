import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar> {
  final Widget leading;
  final Widget title;
  final List<Widget> actions;

  PlatformAppBar({this.leading, @required this.title, this.actions = const []});

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) =>
      new CupertinoNavigationBar(
        leading: leading,
        middle: title,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: actions,
        ),
      );

  @override
  AppBar createAndroidWidget(BuildContext context) => new AppBar(
        leading: leading,
        title: title,
        actions: actions,
      );
}
