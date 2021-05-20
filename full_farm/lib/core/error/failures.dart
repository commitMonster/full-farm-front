import 'package:equatable/equatable.dart';

class Failure extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => [];

}
// General failures
class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InvalidInputFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InvalidJsonFailure extends Failure {
  @override
  List<Object> get props => [];
}

class EncryptionFailure extends Failure {
  @override
  List<Object> get props => null;
}

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [];
}