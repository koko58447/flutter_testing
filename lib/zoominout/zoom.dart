import 'package:flutter/material.dart';
import 'package:testing/zoominout/zoominout.dart';

class ZoomPage extends StatefulWidget {
  @override
  _ZoomPageState createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Zoom in/out'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ZoomInOutPage(),
    );
  }
}
