import 'package:bibletrainer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class SettingRoute extends StatefulWidget {
  const SettingRoute({super.key});

  @override
  State<SettingRoute> createState() => _SettingRouteState();
}

class _SettingRouteState extends State<SettingRoute> {
  bool _sansForgetica = false;
  bool _theLord = false;
  bool _emojiMode = false;
  bool _leftyMode = false;
  bool _sortLastRead = false;
  TextEditingController _reviewPeriod = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sansForgetica = prefs.getBool('settings_sansForgetica') ?? false;
      _theLord = prefs.getBool('settings_theLord') ?? false;
      _emojiMode = prefs.getBool('settings_emojiMode') ?? false;
      _leftyMode = prefs.getBool('settings_leftyMode') ?? false;
      _sortLastRead = prefs.getBool('settings_sortLastRead') ?? false;
      _reviewPeriod.text = prefs.getString('settings_reviewPeriod') ?? "7";
    });
  }

  Future<void> _toggleSetting(String settingName) async {
    final prefs = await SharedPreferences.getInstance();
    bool settingVal = prefs.getBool(settingName) ?? false;
    setState(() {
      prefs.setBool(settingName, !settingVal);
    });
  }

  Future<void> _setReviewPeriod(days) async {
    final prefs = await SharedPreferences.getInstance();
    _reviewPeriod.text = days.toString();
    setState(() {
      prefs.setString("settings_reviewPeriod", days.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        SwitchListTile(
          title: const Text('Use Sans Forgetica font'),
          subtitle: const Text(
              'Sans Forgetica is a font designed with the principles of cognitive psychology to help memorisation.'),
          value: _sansForgetica,
          onChanged: (bool value) {
            _sansForgetica = !_sansForgetica;
            _toggleSetting("settings_sansForgetica");
          },
        ),
        SwitchListTile(
          title: const Text('YHWH'),
          subtitle: const Text('Replace "The LORD" with "YHWH"'),
          value: _theLord,
          onChanged: (bool value) {
            _theLord = !_theLord;
            _toggleSetting("settings_theLord");
          },
        ),
        SwitchListTile(
          title: const Text('Emoji mode'),
          subtitle: const Text(
              'Adds emoji 👋 in the passage text 📖 to aid memorisation 🧠 with pictures 🖼️.'),
          value: _emojiMode,
          onChanged: (bool value) {
            _emojiMode = !_emojiMode;
            _toggleSetting("settings_emojiMode");
          },
        ),
        SwitchListTile(
            title: const Text('Left handed mode'),
            subtitle: const Text(
                'Enable left-handed model to make the left side of the screen the forwards selection.'),
            value: _leftyMode,
            onChanged: (bool value) {
              _leftyMode = !_leftyMode;
              _toggleSetting("settings_leftyMode");
            }),
        SwitchListTile(
            title: const Text('Sort by last read date'),
            subtitle: const Text('Defaults to Biblical order.'),
            value: _sortLastRead,
            onChanged: (bool value) {
              _sortLastRead = !_sortLastRead;
              _toggleSetting("settings_sortLastRead");
            }),
        ListTile(
          subtitle: TextField(
            controller: _reviewPeriod,
            decoration: InputDecoration(labelText: "Days until review"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (String value) {
              _setReviewPeriod(value);
            },
          ),
        ),
      ])),
    );
  }
}
