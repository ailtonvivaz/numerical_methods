import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformIconButton extends PlatformWidget<CupertinoButton, IconButton> {
  final Widget icon;
  final Function onPressed;

  PlatformIconButton({@required this.icon, @required this.onPressed});

  @override
  IconButton createAndroidWidget(BuildContext context) => IconButton(
        icon: icon,
        onPressed: onPressed,
      );

  @override
  CupertinoButton createIosWidget(BuildContext context) => CupertinoButton(
        child: icon,
        onPressed: onPressed,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        padding: EdgeInsets.all(0),
      );
}
