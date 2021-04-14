import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/entities/user.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class SignInUseCase extends UseCase<User, Params> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.signIn(
      userId: params.userId,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String userId;
  final String password;

  Params({
    @required this.userId,
    @required this.password,
  });

  @override
  List<Object> get props => [userId, password];
}
