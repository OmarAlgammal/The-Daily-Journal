import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:the_daily_journal/services/firebase_auth_service.dart';
import 'package:the_daily_journal/services/local_services.dart';

@GenerateMocks([
  Dio,
  // BaseNewsService,
  BaseLocalServices,
  HiveInterface,
  Box,
  FirebaseAuth,
  User,
  GoogleAuthProviderWrapper,
  GoogleSignIn,
  GoogleSignInAccount,
  OAuthCredential,
  GoogleSignInAuthentication,
  UserCredential,
])
void main() {}
