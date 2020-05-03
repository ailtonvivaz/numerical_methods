import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar> {
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;

  PlatformAppBar(
      {this.leading,
      @required this.title,
      this.actions = const [],
      this.automaticallyImplyLeading = true});

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
        automaticallyImplyLeading: automaticallyImplyLeading,
        transitionBetweenRoutes: false,
      );

  @override
  AppBar createAndroidWidget(BuildContext context) => new AppBar(
        leading: leading,
        title: title,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
      );
}
