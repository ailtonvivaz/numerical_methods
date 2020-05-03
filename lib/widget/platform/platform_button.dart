import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformButton extends PlatformWidget<CupertinoButton, MaterialButton> {
  final Widget child;
  final String title;
  final Function onPressed;

  PlatformButton({this.child, this.title, @required this.onPressed})
      : assert(child != null || title != null);

  @override
  MaterialButton createAndroidWidget(BuildContext context) => RaisedButton(
        color: Theme.of(context).primaryColor,
        child: title == null
            ? child
            : Text(
                title.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
        onPressed: onPressed,
      );

  @override
  CupertinoButton createIosWidget(BuildContext context) => CupertinoButton(
        color: Theme.of(context).primaryColor,
        child: title == null
            ? child
            : Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
        onPressed: onPressed,
      );
}
