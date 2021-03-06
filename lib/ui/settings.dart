
import 'package:Quran/data/themes.dart';
import 'package:Quran/data/uistate.dart';
import 'package:Quran/ui/widget/cardsetting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    var dark = Provider.of<ThemeNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Settings'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            CardSetting(
              title: 'Koyu tema',
              leading: Switch(
                value: dark.darkmode,
                onChanged: (newValue) => dark.switchTheme(newValue),
              ),
            ),
            CardSetting(
              title: 'Çevirmek',
              leading: Switch(
                value: ui.terjemahan,
                onChanged: (newValue) => ui.terjemahan = newValue,
              ),
            ),
            CardSetting(
              title: 'yorum',
              leading: Switch(
                value: ui.tafsir,
                onChanged: (newValue) => ui.tafsir = newValue,
              ),
            ),
            CardSlider(
              title: 'Arapça metin boyutu',
              slider: Slider(
                min: 0.5,
                value: ui.sliderFontSize,
                onChanged: (newValue) => ui.fontSize = newValue,
              ),
              trailing: ui.fontSize.toInt().toString(),
            ),
            CardSlider(
              title: 'Çeviri metni boyutu',
              slider: Slider(
                min: 0.4,
                value: ui.sliderFontSizetext,
                onChanged: (newValue) => ui.fontSizetext = newValue,
              ),
              trailing: ui.fontSizetext.toInt().toString(),
            ),
          ],
        ));
  }
}

class CardSlider extends StatelessWidget {
  const CardSlider({
    Key key,
    @required this.title,
    @required this.slider,
    @required this.trailing,
  }) : super(key: key);

  final String title;
  final Widget slider;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        elevation: 0,
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 10, right: 30, left: 15),
          title: Text(title),
          subtitle: slider,
          trailing: Text(trailing),
        ),
      ),
    );
  }
}
