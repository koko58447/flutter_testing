import 'package:flutter/material.dart';
import 'package:testing/animatebottonbar/animatebottom.dart';
import 'package:testing/appbardesign/appbar.dart';
import 'package:testing/appsetting/setting.dart';
import 'package:testing/changelanguage/language.dart';
import 'package:testing/checkconnection/checkconnection.dart';
import 'package:testing/device_info/show_info.dart';
import 'package:testing/face/face_auth.dart';
import 'package:testing/fingerprint/fingerprint.dart';
import 'package:testing/linechat/linechat.dart';
import 'package:testing/lottie/lottie.dart';
import 'package:testing/opensetting/opensetting.dart';
import 'package:testing/pdf/pdf.dart';
import 'package:testing/signature/signature.dart';
import 'package:testing/stepperwidget/stepperwidget.dart';
import 'package:testing/zoominout/zoom.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Flutter'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Card(
            child: ListTile(
              title: Text('Finger Print Auth'),
              leading: Icon(Icons.fingerprint),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FingerPrintPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Face Auth'),
              leading: Icon(Icons.face),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => FaceAuth()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Signature'),
              leading: Icon(Icons.check),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignaturePage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Device Info'),
              leading: Icon(Icons.info),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ShowInfo()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('App Setting'),
              leading: Icon(Icons.settings),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Open Setting'),
              leading: Icon(Icons.open_in_full),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => OpensettingPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Check Internet Connection'),
              leading: Icon(Icons.data_usage),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CheckConnectionPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Animated Bottom Navigation Bar'),
              leading: Icon(Icons.animation),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimateBottomPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Line Chart'),
              leading: Icon(Icons.pie_chart_sharp),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LineChartPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Amazing Lottie Animations'),
              leading: Icon(Icons.animation),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LottiePage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('App Bar Design UI & Transparent'),
              leading: Icon(Icons.design_services_sharp),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AppBarPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Create PDF'),
              leading: Icon(Icons.picture_as_pdf),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PDFPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Use Stepper Widget'),
              leading: Icon(Icons.widgets),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StepperPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Zoom In/Out Image'),
              leading: Icon(Icons.zoom_in),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ZoomPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Awesome 3D ListView Scrolling '),
              leading: Icon(Icons.score),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ShowInfo()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Change Language with Get '),
              leading: Icon(Icons.score),
              trailing: Icon(
                Icons.arrow_right_sharp,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LanguagePage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
