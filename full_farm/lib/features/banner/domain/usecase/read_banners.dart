import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';

class ReadBannersUseCase extends UseCase<List<Banner>, ReadBannersParams> {
  final BannerRepository repository;

  ReadBannersUseCase(this.repository);

  @override
  Future<Either<Failure, List<Banner>>> call(ReadBannersParams params) async {
    return await repository.readBanners(
      orderBy: params.orderBy,
      start: params.start,
      end: params.end,
      sort: params.sort,
    );
  }
}

class ReadBannersParams extends Equatable {
  final String orderBy;
  final String start;
  final String end;
  final String sort;

  ReadBannersParams({
    this.orderBy,
    this.start,
    this.end,
    this.sort,
  });

  @override
  List<Object> get props => [orderBy,
    start,
    end,
    sort,
  ];
}
