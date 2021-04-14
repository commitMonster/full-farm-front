import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/entities/user.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CheckUserIdUseCase extends UseCase<bool, Params> {
  final AuthRepository repository;

  CheckUserIdUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.checkUserId(
      userId: params.userId,
    );
  }
}

class Params extends Equatable {
  final String userId;

  Params({
    @required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
