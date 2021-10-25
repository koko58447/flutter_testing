import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

class CheckConnectionPage extends StatefulWidget {
  @override
  _CheckConnectionPageState createState() => _CheckConnectionPageState();
}

class _CheckConnectionPageState extends State<CheckConnectionPage> {
  StreamSubscription subscription;
  StreamSubscription internetSubscription;
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;
  @override
  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        this.result = result;
      });
    });
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    internetSubscription.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Internet Connection'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              hasInternet = await InternetConnectionChecker().hasConnection;

              result = await Connectivity().checkConnectivity();

              final color = hasInternet ? Colors.green : Colors.red;
              final text = hasInternet ? 'Internet' : 'No internet';

              if (result == ConnectivityResult.mobile) {
                showSimpleNotification(
                  Text('$text : Moblie Network',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  background: color,
                );
              } else if (result == ConnectivityResult.wifi) {
                showSimpleNotification(
                  Text('$text : Wifi Network',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  background: color,
                );
              } else {
                showSimpleNotification(
                  Text('$text : No Network',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  background: color,
                );
              }
            },
            child: Text('Check Internet'),
          ),
        ));
  }
}
