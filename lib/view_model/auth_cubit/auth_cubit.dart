import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_daily_journal/view_model/auth_cubit/auth_states.dart';

import '../../services/firebase_auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseFirebaseAuth _baseFirebaseAuth;

  AuthCubit(this._baseFirebaseAuth) : super(AuthState.registrationIsBeingVerifiedState());


  static AuthCubit of (context) => BlocProvider.of<AuthCubit>(context);

  Stream<User?> checkRegistration() => _baseFirebaseAuth.authStateChanges();

  void signInWithGoogle() async {
    final response = await _baseFirebaseAuth.signInWithGoogle();
    response.fold(
      (l) => emit(AuthState.failedToRegister(l.message)),
      (r) => emit(AuthState.userRegisteredSuccessfully()),
    );
  }

  void signOut() async{
    emit(AuthState.signingOut());
    await _baseFirebaseAuth.signOut();
  }
}
