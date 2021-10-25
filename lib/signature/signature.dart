import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:signature/signature.dart';
import 'package:testing/general/widget.dart';
import 'package:testing/signature/showSignature.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  SignatureController controller;
  @override
  @override
  void initState() {
    super.initState();
    controller = SignatureController(
      penColor: Colors.white,
      penStrokeWidth: 5,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Future<Uint8List> exportSignature() async {
      final exportController = SignatureController(
        penStrokeWidth: 2,
        penColor: Colors.black,
        exportBackgroundColor: Colors.white,
        points: controller.points,
      );
      final signature = await exportController.toPngBytes();
      exportController.dispose();
      return signature;
    }

    Future storeSignature(BuildContext context, signature) async {
      final status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      final time = DateTime.now().toIso8601String().replaceAll(".", ":");
      final name = 'signature_$time.png';
      final result = await ImageGallerySaver.saveImage(signature, name: name);
      final isSuccess = result['isSuccess'];
      if (isSuccess) {
        showSnackBar(context, "Save to signature folder");
      }
    }

    Widget buildButtons(BuildContext context) {
      return Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              iconSize: 36,
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () async {
                if (controller.isNotEmpty) {
                  final signature = await exportSignature();
                  await storeSignature(context, signature);
                  // await Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => ShowSignature(
                  //           signature: signature,
                  //         )));
                }
              },
            ),
            IconButton(
              iconSize: 36,
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                controller.clear();
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Signature'),
        ),
      body: Column(
        children: [
          Signature(
            controller: controller,
            backgroundColor: Colors.red,
          ),
          buildButtons(context),
        ],
      ),
    );
  }
}
