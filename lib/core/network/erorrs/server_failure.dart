import 'package:equatable/equatable.dart';

class ServerFailure extends Equatable {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [];
}
