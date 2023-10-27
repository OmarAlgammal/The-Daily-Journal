import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/network/exceptions/server_exception.dart';

class GoogleAuthProviderWrapper {
  OAuthCredential credential(GoogleSignInAuthentication? googleAuth) {
    return GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  }
}

abstract class BaseFirebaseAuth {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<Either<MyException, UserCredential>> signInWithGoogle();

  Future<void> signOut();
}

class FirebaseAuthentication implements BaseFirebaseAuth {
  late final FirebaseAuth _firebaseAuth;
  late final GoogleSignIn googleSignIn;
  late final GoogleAuthProviderWrapper wrapperGoogleAuthProvider;

  FirebaseAuthentication(
      this._firebaseAuth, this.googleSignIn, this.wrapperGoogleAuthProvider);

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<Either<MyException, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = wrapperGoogleAuthProvider.credential(googleAuth);
      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return Right(userCredential);
    } catch (e) {
      return Left(ServerException(
          message:
              'An error occurred while signing in with Google : ${e.toString()}'));
    }
  }
}
