import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  User? currentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError("이메일을 입력해 주세요.");
      return;
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해 주세요.");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message!);
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError('이메일을 입력해주세요.');
      return;
    } else if (password.isEmpty) {
      onError('비밀번호를 입력해주세요.');
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      // Firebase 에러 메시지를 한글로 변환
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = '해당 이메일로 가입된 계정이 없습니다.';
          break;
        case 'wrong-password':
          errorMessage = '잘못된 비밀번호입니다.';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일 형식입니다.';
          break;
        case 'user-disabled':
          errorMessage = '해당 계정은 비활성화되었습니다.';
          break;
        default:
          errorMessage = e.message ?? '로그인 중 오류가 발생했습니다.';
      }
      onError(errorMessage);
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // 비밀번호 재설정 이메일 보내기
  Future<void> sendPasswordResetEmail({
    required String email,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError('이메일을 입력해주세요.');
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일 형식입니다.';
          break;
        case 'user-not-found':
          errorMessage = '해당 이메일로 가입된 계정이 없습니다.';
          break;
        default:
          errorMessage = e.message ?? '비밀번호 재설정 이메일 전송 중 오류가 발생했습니다.';
      }
      onError(errorMessage);
    } catch (e) {
      onError(e.toString());
    }
  }
}
