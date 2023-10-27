import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MyException extends Equatable {
  final String message;
  final IconData? icon;

  const MyException({required this.message, this.icon});
}

class ServerException extends MyException {
  const ServerException({required super.message, super.icon});

  @override
  List<Object?> get props => [message, icon];
}

class NoInternetConnectionException extends MyException {
  const NoInternetConnectionException({required super.message, super.icon});

  @override
  List<Object?> get props => [message, icon];
}
