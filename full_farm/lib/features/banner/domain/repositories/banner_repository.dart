import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:full_farm/core/error/failures.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<Banner>>> readBanners({
    String orderBy,
    String start,
    String end,
    String sort,
  });

  Future<Either<Failure, Banner>> readBannerById({
    @required int id,
  });

  Future<Either<Failure, Banner>> createBanner({
    @required Banner banner,
  });

  Future<Either<Failure, Banner>> updateBanner({
    @required int id,
    @required Banner banner,
  });

  Future<Either<Failure, Banner>> updateActivationOfBanner({
    @required int id,
    @required bool activation,
  });

  Future<Either<Failure, void>> deleteBanner({
    @required int id,
  });
}
