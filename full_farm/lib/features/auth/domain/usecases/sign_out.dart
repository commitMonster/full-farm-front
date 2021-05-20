import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class SignOutUseCase extends UseCase<void, NoParams> {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
