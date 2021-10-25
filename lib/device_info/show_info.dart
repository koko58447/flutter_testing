import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testing/device_info/device_api.dart';

class ShowInfo extends StatefulWidget {
  @override
  _ShowInfoState createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  Map<String, dynamic> map = {};

  String ipaddress,
      packagename1,
      appVersion1,
      phone1,
      phoneversion1,
      operationsystem1,
      screenResoulation1;
  @override
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final packagename = await PackageInfoApi.getPackageName();
    final appVersion = await PackageInfoApi.getAppVersion();
    final ipAddress = await IpInfoApi.getIPAddress();
    final phone = await DeviceInfoApi.getPhoneInfo();
    final phoneversion = await DeviceInfoApi.getPhoneVersion();
    final operationsystem = await DeviceInfoApi.getOperationSystem();
    final screenResoulation = await DeviceInfoApi.getScreenResolution();
    if (!mounted) return;

    print(appVersion);

    setState(() {
      ipaddress = ipAddress;
      packagename1 = packagename;
      appVersion1 = appVersion;
      phone1 = phone;
      phoneversion1 = phoneversion;
      operationsystem1 = operationsystem;
      screenResoulation1 = screenResoulation;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android Device Info'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('IP Address'),
            subtitle: Text(ipaddress),
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            title: Text('Package Name'),
            subtitle: Text(packagename1),
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            title: Text('App Version'),
            subtitle: Text(appVersion1),
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            title: Text('Phone'),
            subtitle: Text(phone1),
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            title: Text('Phone Version'),
            subtitle: Text(phoneversion1),
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            title: Text('Operation System'),
            subtitle: Text(operationsystem1),
          ),
          Divider(
            height: 10,
          ),
          ListTile(
            title: Text('Screen Resolution'),
            subtitle: Text(screenResoulation1),
          ),
          Divider(
            height: 10,
          )
        ],
      ),
    );
  }
}
