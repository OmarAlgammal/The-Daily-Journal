import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/network/erorrs/server_failure.dart';

abstract class BaseFirebaseAuth {
  User? get currentUser;

  Stream<User?> authStateChanges();

  Future<Either<ServerFailure, UserCredential>> signInWithGoogle();

  Future<void> signOut();
}

class FirebaseAuthentication implements BaseFirebaseAuth {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Future<void> signOut() async {
      await _firebaseAuth.signOut();
  }

  @override
  Future<Either<ServerFailure, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return right(userCredential);
    } on FirebaseException catch (e) {
      return left(ServerFailure('error : ${e.message}'));
    } catch (e) {
      return left(ServerFailure('An error occurred while signing in with Google : ${e.toString()}'));
    }
  }


}
