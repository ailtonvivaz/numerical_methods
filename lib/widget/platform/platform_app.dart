import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numerical_methods/widget/platform/platform_widget.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  final String title;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;

  PlatformApp(
      {this.title, @required this.home, this.initialRoute, this.routes});

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
        initialRoute: initialRoute,
        routes: routes,
      );

  @override
  CupertinoApp createIosWidget(BuildContext context) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: home,
        initialRoute: initialRoute,
        routes: routes,
      );
}
