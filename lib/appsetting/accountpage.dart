import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:testing/general/widget.dart';

class AccountPage extends StatelessWidget {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  @override
  Widget build(BuildContext context) {
    Widget buildPrivacy() => SimpleSettingsTile(
          title: 'Privacy',
          subtitle: '',
          leading: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          onTap: () {
            showSnackBar(context, 'Clicked Privacy');
          },
        );

    Widget buildSecurity() => SimpleSettingsTile(
          title: 'Security',
          subtitle: '',
          leading: Icon(
            Icons.security,
            color: Colors.blue,
          ),
          onTap: () {
            showSnackBar(context, 'Clicked Security');
          },
        );

    Widget buildAccountInfo() => SimpleSettingsTile(
          title: 'Account Info',
          subtitle: '',
          leading: Icon(
            Icons.text_snippet,
            color: Colors.blue,
          ),
          onTap: () {
            showSnackBar(context, 'Clicked Account Info');
          },
        );

    Widget buildLanguage() => DropDownSettingsTile(
          title: 'Language',
          settingKey: keyLanguage,
          selected: 1,
          values: <int, String>{
            1: 'English',
            2: 'Myanmar',
            3: 'Chinese',
            4: 'Spanish',
          },
          onChange: (language) {},
        );

    Widget buildLocation() => TextInputSettingsTile(
          title: 'Location',
          settingKey: keyLocation,
          initialValue: 'Myanmar',
          onChange: (location) {},
        );

    return SimpleSettingsTile(
      title: 'Account Settings',
      subtitle: 'Privacy, Security, Language',
      leading: Icon(Icons.person, color: Colors.green),
      child: SettingsScreen(
        title: 'Account Settings',
        children: [
          buildLanguage(),
          buildLocation(),
          buildPrivacy(),
          buildSecurity(),
          buildAccountInfo(),
        ],
      ),
    );
  }
}
