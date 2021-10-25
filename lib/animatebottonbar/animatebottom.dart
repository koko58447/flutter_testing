import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:testing/animatebottonbar/page1.dart';
import 'package:testing/animatebottonbar/page2.dart';
import 'package:testing/animatebottonbar/page3.dart';

class AnimateBottomPage extends StatefulWidget {
  @override
  _AnimateBottomPageState createState() => _AnimateBottomPageState();
}

class _AnimateBottomPageState extends State<AnimateBottomPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate Bottom Bar'),
        centerTitle: true,
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBody() {
    switch (index) {
      case 0:
      case 1:
        return Page1();
      case 2:
        return Page2();
      case 3:
        return Page3();
      default:
        return Page1();
    }
  }

  Widget buildBottomNavigation() {
    final inactiveColor = Colors.grey;
    return BottomNavyBar(
      backgroundColor: Colors.black,
      containerHeight: 80,
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.green,
            inactiveColor: inactiveColor,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.deepOrangeAccent,
            inactiveColor: inactiveColor,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Messages'),
            activeColor: Colors.pink,
            inactiveColor: inactiveColor,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.lightBlueAccent,
            inactiveColor: inactiveColor,
            textAlign: TextAlign.center),
      ],
      onItemSelected: (int index) {
        setState(() {
          this.index = index;
        });
      },
    );
  }
}
