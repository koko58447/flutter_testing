import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:signature/signature.dart';
import 'package:testing/face/face_auth.dart';
import 'package:testing/fingerprint/local_auth_api.dart';
import 'package:testing/signature/signature.dart';

class FingerPrintPage extends StatefulWidget {
  @override
  _FingerPrintPageState createState() => _FingerPrintPageState();
}

class _FingerPrintPageState extends State<FingerPrintPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildText(String text, bool checked) => Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              checked
                  ? Icon(Icons.check, color: Colors.green, size: 10)
                  : Icon(Icons.close, color: Colors.red, size: 10),
              const SizedBox(
                width: 12,
              ),
              Text(text, style: TextStyle(fontSize: 24)),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('Finger Print'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(height: 100),
          ElevatedButton(
            child: const Text('Finger Print Authenticate'),
            onPressed: () async {
              final isAuthenticated = await LocalAuthApi.authenticate();
              if (isAuthenticated) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignaturePage()));
              }
            },
          ),
        ],
      ),
    );
  }
}
