import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class OpensettingPage extends StatefulWidget {
  @override
  _OpensettingPageState createState() => _OpensettingPageState();
}

class _OpensettingPageState extends State<OpensettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Card(
            child: ListTile(
              title: Text('Open App Settings'),
              leading: Icon(Icons.settings),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openAppSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Device Setting'),
              leading: Icon(Icons.device_hub),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openDeviceSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Location Settings'),
              leading: Icon(Icons.location_city),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openLocationSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Notification Settings'),
              leading: Icon(Icons.notifications),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openNotificationSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Wifi Setting'),
              leading: Icon(Icons.wifi),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openWIFISettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Bluetooth Setting'),
              leading: Icon(Icons.bluetooth),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openBluetoothSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open NRF Settings'),
              leading: Icon(Icons.nfc),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openNFCSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open VPN Settings'),
              leading: Icon(Icons.vpn_key),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openVPNSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Security Setting'),
              leading: Icon(Icons.security),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openSecuritySettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Data Roaming'),
              leading: Icon(Icons.data_usage),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openDataRoamingSettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Display Settings'),
              leading: Icon(Icons.settings_display_outlined),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openDisplaySettings();
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Internal Storage Settings'),
              leading: Icon(Icons.settings),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                AppSettings.openInternalStorageSettings();
              },
            ),
          ),
        ],
      ),
    );
  }
}
