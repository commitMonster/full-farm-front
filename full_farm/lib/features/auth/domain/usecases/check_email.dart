import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/entities/user.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CheckInputValidationUseCase extends UseCase<bool, Params> {
  final AuthRepository repository;

  CheckInputValidationUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.checkInputValidation(
      inputType: params.inputType,
      input: params.input,
    );
  }
}

class Params extends Equatable {
  final String inputType;
  final String input;

  Params({
    @required this.inputType,
    @required this.input,
  });

  @override
  List<Object> get props => [inputType, input];
}
