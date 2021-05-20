import 'package:dartz/dartz.dart';
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
    int id,
  });

  Future<Either<Failure, Banner>> createBanner({
    Banner banner,
  });

  Future<Either<Failure, Banner>> updateBanner({
    int id,
    Banner banner,
  });

  Future<Either<Failure, Banner>> updateActivationOfBanner({
    int id,
    bool activation,
  });

  Future<Either<Failure, void>> deleteBanner({
    int id,
  });
}
