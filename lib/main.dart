import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:testing/changelanguage/localstring.dart';
import 'package:testing/face/face_auth.dart';
import 'package:testing/home.dart';
import 'package:testing/signature/signature.dart';
import 'package:overlay_support/overlay_support.dart';
import 'fingerprint/fingerprint.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        //translations: LocalString(),
        // locale: Locale('en', 'US'),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}
