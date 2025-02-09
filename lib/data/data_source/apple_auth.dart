import 'package:firebase_auth/firebase_auth.dart';

class AppleAuth {
  Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }
}
