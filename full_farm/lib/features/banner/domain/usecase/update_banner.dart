import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateBannerUseCase extends UseCase<Banner, UpdateBannerParams> {
  final BannerRepository repository;

  UpdateBannerUseCase(this.repository);

  @override
  Future<Either<Failure, Banner>> call(UpdateBannerParams params) async {
    return await repository.updateBanner(
      id: params.id,
      banner: params.banner,
    );
  }
}

class UpdateBannerParams extends Equatable {
  final int id;
  final Banner banner;

  UpdateBannerParams({
    @required this.id,
    @required this.banner,
  });

  @override
  List<Object> get props => [
    id,
    banner,
  ];
}
