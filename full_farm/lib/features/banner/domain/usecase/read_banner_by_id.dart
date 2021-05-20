import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class ReadBannerByIdUseCase extends UseCase<Banner, ReadBannerByIdParams> {
  final BannerRepository repository;

  ReadBannerByIdUseCase(this.repository);

  @override
  Future<Either<Failure, Banner>> call(ReadBannerByIdParams params) async {
    return await repository.readBannerById(
      id: params.id,
    );
  }
}

class ReadBannerByIdParams extends Equatable {
  final int id;

  ReadBannerByIdParams({
    @required this.id,
  });

  @override
  List<Object> get props => [
    id,
  ];
}
