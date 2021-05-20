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
      title: params.title,
      description: params.description,
      type: params.type,
      image: params.image,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

class UpdateBannerParams extends Equatable {
  final int id;
  final String title;
  final String description;
  final int type;
  final List<String> image;
  final String startDate;
  final String endDate;

  UpdateBannerParams({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.type,
    @required this.image,
    @required this.startDate,
    @required this.endDate,
  });

  @override
  List<Object> get props => [
    id,
    title,
    description,
    type,
    image,
    startDate,
    endDate,
  ];
}
