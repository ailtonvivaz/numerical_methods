import 'package:flutter/material.dart';
import 'package:numerical_methods/page/home_page.dart';
import 'package:numerical_methods/widget/platform/platform_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => App();
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  Brightness brightness = Brightness.light;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    setState(() {
      brightness = WidgetsBinding.instance.window.platformBrightness;
    });
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    print(
        "mudou brilho para ${WidgetsBinding.instance.window.platformBrightness}");
    setState(() {
      brightness = WidgetsBinding.instance.window.platformBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: brightness),
      child: PlatformApp(
        title: 'Numerical Methods',
        home: HomePage(),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
