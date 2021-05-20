import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/entities/user.dart';

import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> checkInputValidation({
    String inputType,
    String input
  });

  Future<Either<Failure, void>> signUp({
    String userId,
    String password,
    String name,
    String email,
    String address
  });

  Future<Either<Failure, User>> signIn({
    String userId,
    String password
  });

  Future<Either<Failure, void>> signOut();
}
