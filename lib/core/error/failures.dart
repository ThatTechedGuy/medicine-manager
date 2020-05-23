import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  List<Object> get props => [];
}