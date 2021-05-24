import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateActivationOfBannerUseCase extends UseCase<Banner, UpdateActivationOfBannerParams> {
  final BannerRepository repository;

  UpdateActivationOfBannerUseCase(this.repository);

  @override
  Future<Either<Failure, Banner>> call(UpdateActivationOfBannerParams params) async {
    return await repository.updateActivationOfBanner(
      id: params.id,
      activation: params.activation,
    );
  }
}

class UpdateActivationOfBannerParams extends Equatable {
  final int id;
  final bool activation;

  UpdateActivationOfBannerParams({
    @required this.id,
    @required this.activation,
  });

  @override
  List<Object> get props => [
    id,
    activation,
  ];
}
