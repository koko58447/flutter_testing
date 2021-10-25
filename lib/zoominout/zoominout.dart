import 'package:flutter/material.dart';

class ZoomInOutPage extends StatefulWidget {
  @override
  _ZoomInOutPageState createState() => _ZoomInOutPageState();
}

class _ZoomInOutPageState extends State<ZoomInOutPage> {
  TransformationController controller;
  AnimationController animationController;
  Animation<Matrix4> animation;
  final double minscale = 1;
  final double maxsacle = 4;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        transformationController: controller,
        clipBehavior: Clip.none,
        panEnabled: false,
        minScale: minscale,
        maxScale: maxsacle,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/forest1.jpg', fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
