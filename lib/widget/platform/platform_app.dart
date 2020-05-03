import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_app_bar.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  final String title;
  final Widget home;

  PlatformApp({this.title, @required this.home});

  @override
  MaterialApp createAndroidWidget(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            isDense: true,
            border: UnderlineInputBorder(),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          canvasColor: Colors.black,
        ),
        home: home,
      );

  @override
  CupertinoApp createIosWidget(BuildContext context) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: home,
      );
}
