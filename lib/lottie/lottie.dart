import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatefulWidget {
  @override
  _LottiePageState createState() => _LottiePageState();
}

class _LottiePageState extends State<LottiePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Lottie'),
        centerTitle: true,
      ),
      body: Center(
        child: Lottie.network(
            "https://assets9.lottiefiles.com/packages/lf20_vzyyuegw.json"),
      ),
    );
  }
}
