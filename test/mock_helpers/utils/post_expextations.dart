import 'package:mockito/mockito.dart';

extension PostExpextationExtension on PostExpectation {
  void answer<T>(T value) => thenAnswer((_) async => value);

  void get answerVoid => thenAnswer((_) async => {});

  void get answerNull => thenAnswer((_) async => null);

  void get returnNull => thenReturn(null);

  void get returnVoid => thenReturn({});
}
