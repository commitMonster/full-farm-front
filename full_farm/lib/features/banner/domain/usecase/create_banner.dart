import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class CreateBannerUseCase extends UseCase<Banner, CreateBannerParams> {
  final BannerRepository repository;

  CreateBannerUseCase(this.repository);

  @override
  Future<Either<Failure, Banner>> call(CreateBannerParams params) async {
    return await repository.createBanner(
       banner: params.banner,
    );
  }
}

class CreateBannerParams extends Equatable {
  final Banner banner;

  CreateBannerParams({
    @required this.banner,
  });

  @override
  List<Object> get props => [
    banner,
  ];
}
