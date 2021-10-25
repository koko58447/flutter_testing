import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:testing/appsetting/accountpage.dart';
import 'package:testing/general/widget.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    Widget buildLogout() => SimpleSettingsTile(
          title: 'Logout',
          subtitle: '',
          leading: Icon(
            Icons.logout,
            color: Colors.blue,
          ),
          onTap: () {
            showSnackBar(context, 'Clicked Logout');
          },
        );

    Widget buildDeleteAccount() => SimpleSettingsTile(
          title: 'Delete Account',
          subtitle: '',
          leading: Icon(
            Icons.delete,
            color: Colors.blue,
          ),
          onTap: () {
            showSnackBar(context, 'Clicked Delete');
          },
        );

    return Scaffold(
        appBar: AppBar(
          title: Text('App Setting'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'General',
              children: [
                AccountPage(),
                // buildLogout(),
                // buildDeleteAccount(),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            SettingsGroup(
              title: 'Feed Back',
              children: [
                // buildLogout(),
                // buildDeleteAccount(),
              ],
            ),
          ],
        )));
  }
}
