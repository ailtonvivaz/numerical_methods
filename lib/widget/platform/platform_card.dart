import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformCard extends PlatformWidget<Container, Card> {
  final Widget child;

  PlatformCard({this.child});

  @override
  Card createAndroidWidget(BuildContext context) {
    return Card(child: child);
  }

  @override
  Container createIosWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
