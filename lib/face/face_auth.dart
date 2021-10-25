import 'package:flutter/material.dart';
import 'package:testing/face/local_face_api.dart';
import 'package:testing/signature/signature.dart';

class FaceAuth extends StatefulWidget {
  @override
  _FaceAuthState createState() => _FaceAuthState();
}

class _FaceAuthState extends State<FaceAuth> {
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
        title: Text('Face Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(height: 100),
          ElevatedButton(
            child: const Text('Face Authenticate'),
            onPressed: () async {
              final isAuthenticated = await LocalAuthFaceApi.authenticate();
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
