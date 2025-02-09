import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

class KakaoAuth {
  Future<UserCredential> signInWithKakao() async {
    if (await isKakaoTalkInstalled()) {
      try {
        print("카카오톡 앱으로 로그인 시도");
        await UserApi.instance.loginWithKakaoTalk();
        print("카카오톡 앱 로그인 성공");
        return await _signInWithFirebase();
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          throw Exception('User canceled login');
        }
        print("카카오 계정으로 로그인 시도");
        await UserApi.instance.loginWithKakaoAccount();
        print("카카오 계정 로그인 성공");
        return await _signInWithFirebase();
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        return await _signInWithFirebase();
      } catch (error) {
        throw Exception('Failed to login with Kakao account: $error');
      }
    }
  }

  Future<UserCredential> _signInWithFirebase() async {
    print("Firebase 연동 시작");
    try {
      var provider = OAuthProvider("oidc.labtalk");
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      var credential = provider.credential(
        idToken: token.idToken,
        accessToken: token.accessToken,
      );
      print("Firebase 인증 시도");
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      print("Firebase 연동 실패: $error");
      rethrow;
    }
  }
}
