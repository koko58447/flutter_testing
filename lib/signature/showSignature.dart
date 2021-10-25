import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testing/general/widget.dart';

class ShowSignature extends StatefulWidget {
  final Uint8List signature;
  ShowSignature({@required this.signature});
  @override
  _ShowSignatureState createState() => _ShowSignatureState();
}

class _ShowSignatureState extends State<ShowSignature> {
  Future storeSignature(BuildContext context) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    final time = DateTime.now().toIso8601String().replaceAll(".", ":");
    final name = 'signature_$time.png';
    final result =
        await ImageGallerySaver.saveImage(widget.signature, name: name);
    final isSuccess = result['isSuccess'];
    if (isSuccess) {
      Navigator.pop(context);
      showSnackBar(context, "Save to signature folder");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await storeSignature(context);
          },
          icon: Icon(Icons.clear),
        ),
        title: Text("Store Signature"),
        centerTitle: true,
      ),
      body: Center(
        child: Image.memory(widget.signature),
      ),
    );
  }
}
