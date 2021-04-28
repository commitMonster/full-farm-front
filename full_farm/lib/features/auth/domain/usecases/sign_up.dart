import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class SignUpUseCase extends UseCase<void, SignUpParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SignUpParams params) async {
    return await repository.signUp(
      userId: params.userId,
      password: params.password,
      name: params.name,
      email: params.email,
      address: params.address,
    );
  }
}

class SignUpParams extends Equatable {
  final String userId;
  final String password;
  final String name;
  final String email;
  final String address;

  SignUpParams({
    @required this.userId,
    @required this.password,
    @required this.name,
    @required this.email,
    @required this.address,
  });

  @override
  List<Object> get props => [userId, password, name, email, address];
}
