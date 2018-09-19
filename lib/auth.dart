import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  String _verificationId;

  void verifyPhoneNumber(String number) async {
    PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout =
        (String verificationId) {
      this._verificationId = verificationId;
    };

    PhoneCodeSent phoneCodeSent =
        (String verificationId, [int forceCodeResend]) {
      this._verificationId = verificationId;
    };

    PhoneVerificationCompleted phoneVerificationCompleted =
        (FirebaseUser user) {
      print('verified' + user.uid);
    };

    PhoneVerificationFailed phoneVerificationFailed =
        (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: number,
            timeout: const Duration(seconds: 5),
            verificationCompleted: phoneVerificationCompleted,
            verificationFailed: phoneVerificationFailed,
            codeSent: phoneCodeSent,
            codeAutoRetrievalTimeout: autoRetrievalTimeout)
        .catchError((e) {
      print(e);
      print(e.message);
      print(e.code);
      print(e.details);
    });
  }

  String get verificationId => _verificationId;
}
