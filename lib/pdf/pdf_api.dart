import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class User {
  final String name;
  final int age;

  const User({this.name, this.age});
}

class PDFApi {
  static Future<File> generateTable() async {
    final pdf = Document();
    final headers = ['Name', 'Age'];
    final users = [
      User(name: 'nc', age: 20),
      User(name: 'u chan', age: 20),
      User(name: 'ma ma', age: 20),
    ];

    final data = users.map((user) => [user.name, user.age]).toList();

    pdf.addPage(Page(
        build: (context) => Table.fromTextArray(
              headers: headers,
              data: data,
            )));
    return saveDocument(name: 'my_example.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({String name, Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Future<File> generateImage() async {
    final pdf = Document();

    final image =
        (await rootBundle.load("assets/forest1.jpg")).buffer.asUint8List();
    final image1 =
        (await rootBundle.load("assets/forest2.jpg")).buffer.asUint8List();
    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (context) {
        if (context.pageNumber == 1) {
          return FullPage(
            ignoreMargins: true,
            child: Image(MemoryImage(image), fit: BoxFit.cover),
          );
        } else {
          return Container();
        }
      },
    );

    pdf.addPage(MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
              Container(
                height: pageTheme.pageFormat.availableHeight - 1,
                child: Center(
                    child: Text('Foerground Text',
                        style:
                            TextStyle(color: PdfColors.white, fontSize: 48))),
              ),
              Image(MemoryImage(image)),
              Image(MemoryImage(image1)),
              Center(
                  child: ClipRRect(
                      horizontalRadius: 32,
                      verticalRadius: 32,
                      child: Image(
                        MemoryImage(image),
                        width: pageTheme.pageFormat.availableWidth / 2,
                      ))),
              GridView(
                children: [
                  Image(MemoryImage(image)),
                  Image(MemoryImage(image)),
                  Image(MemoryImage(image)),
                  Image(MemoryImage(image1)),
                  Image(MemoryImage(image1)),
                  Image(MemoryImage(image1)),
                ],
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
            ]));

    return saveDocumet1(name: 'image_example', pdf: pdf);
  }

  static Future<File> saveDocumet1({String name, Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }
}
