
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_states.freezed.dart';

@Freezed()
abstract class AuthState with _$AuthState{

  factory AuthState.registrationIsBeingVerifiedState() = RegistrationIsBeingVerifiedState;
  factory AuthState.userRegisteredSuccessfully() = UserRegisteredSuccessfully;
  factory AuthState.failedToRegister(String message) = FailedToRegister;
  factory AuthState.signingOut() = SigningOut;
}





