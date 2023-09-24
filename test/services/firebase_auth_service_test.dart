import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_journal/services/firebase_auth_service.dart';

import '../mock_helpers/mock_generations.mocks.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignInAccount? mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockUserCredential mockUserCredential;
  late MockUser? mockUser;
  late MockOAuthCredential mockOAuthCredential;
  late MockGoogleAuthProviderWrapper mockGoogleAuthProviderWrapper;
  late FirebaseAuthentication firebaseAuthentication;
  late StreamController<MockUser?> streamController;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    mockGoogleSignIn = MockGoogleSignIn();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockOAuthCredential = MockOAuthCredential();
    mockGoogleAuthProviderWrapper = MockGoogleAuthProviderWrapper();

    firebaseAuthentication = FirebaseAuthentication(mockFirebaseAuth, mockGoogleSignIn, mockGoogleAuthProviderWrapper);

    streamController = StreamController<MockUser?>();
  });

  test('authStateChanges() should return Stream<User?>', () async {
    when(mockFirebaseAuth.authStateChanges())
        .thenAnswer((_) => streamController.stream);

    final result = firebaseAuthentication.authStateChanges();

    verify(firebaseAuthentication.authStateChanges()).called(1);
    expect(result, streamController.stream);
  });

  test('signOut() should sign out the user', () async {
    // Arrange
    // Mock the signOut method
    when(mockFirebaseAuth.signOut()).thenAnswer((_) async {});

    // Act
    await firebaseAuthentication.signOut();

    // Assert
    verify(mockFirebaseAuth.signOut()).called(1);
  });

  test('currentUser() should return User?', () {
    // Arrange
    when(mockFirebaseAuth.currentUser).thenReturn(mockUser);

    // Act
    final result = firebaseAuthentication.currentUser;

    // Assert
    expect(result, isA<User?>());
  });

  group('signInWithGoogle', () {
    test('signInWithGoogle() should return Right<UserCredential>', () async{
      // Arrange
      when(mockGoogleSignIn.signIn()).thenAnswer((_) async => mockGoogleSignInAccount);
      when(mockGoogleSignInAccount?.authentication).thenAnswer((realInvocation) async => mockGoogleSignInAuthentication);
      when(mockGoogleAuthProviderWrapper.credential(mockGoogleSignInAuthentication)).thenReturn(mockOAuthCredential);
      when(mockFirebaseAuth.signInWithCredential(mockOAuthCredential)).thenAnswer((_) async=> mockUserCredential);

      // Act
      final result = await firebaseAuthentication.signInWithGoogle();

      // Assert
      expect(result, isA<Right>());
      verify(firebaseAuthentication.signInWithGoogle()).called(1);
    });

    test('signInWithGoogle() should return Left(<ServerFailure>', () async{
      // Arrange
      when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

      // Act
      final result = await firebaseAuthentication.signInWithGoogle();

      // Assert
      expect(result, isA<Left>());

    });


  });

}
