import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformListTile extends PlatformWidget<Widget, ListTile> {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget trailing;

  PlatformListTile({this.leading, this.title, this.subtitle, this.trailing});

  @override
  ListTile createAndroidWidget(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title == null ? null : Text(title),
      subtitle: subtitle == null ? null : Text(subtitle),
      trailing: trailing,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              leading == null
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: leading,
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: theme.textTheme.subhead),
                  subtitle == null
                      ? Container()
                      : Text(subtitle,
                          style: theme.textTheme.body1.copyWith(color: theme.textTheme.caption.color)),
                ],
              ),
            ],
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }
}
