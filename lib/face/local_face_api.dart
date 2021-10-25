import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthFaceApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailabel = await hasBiometrics();
    if (!isAvailabel) return false;

    try {
      return await _auth.authenticateWithBiometrics(
        androidAuthStrings: AndroidAuthMessages(
          signInTitle: 'face ID required',
        ),
        localizedReason: 'scan face to auth',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      return false;
    }
  }
}
