import 'package:Quran/data/location.dart';
import 'package:Quran/data/themes.dart';
import 'package:Quran/data/uistate.dart';
import 'package:Quran/ui/about.dart';
import 'package:Quran/ui/compass.dart';
import 'package:Quran/ui/home.dart';
import 'package:Quran/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(builder: (_) => UiState()),
      ChangeNotifierProvider(builder: (_) => ThemeNotifier()),
      ChangeNotifierProvider(builder: (_) => LocationNotifier()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).curretThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/settings': (context) => Settings(),
        '/about': (context) => About(),
        '/kiblah': (context) => Compass(),
      },
    );
  }
}
