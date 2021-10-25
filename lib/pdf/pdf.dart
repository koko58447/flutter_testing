import 'package:flutter/material.dart';
import 'package:testing/pdf/pdf_api.dart';

class PDFPage extends StatefulWidget {
  @override
  _PDFPageState createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate PDF'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final pdfFile = await PDFApi.generateTable();
                  PDFApi.openFile(pdfFile);
                },
                child: Text("Table PDF"),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () async {
                  final pdfFile = await PDFApi.generateImage();
                  PDFApi.openFile(pdfFile);
                },
                child: Text("Image PDF"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
