import 'package:dartz/dartz.dart';
import 'package:full_farm/features/banner/data/datasources/banner_remote_data_source.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:meta/meta.dart';
import 'package:full_farm/features/auth/data/datasources/auth_local_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  BannerRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Banner>>> readBanners({
    String orderBy,
    String start,
    String end,
    String sort,
  }) async {
    try{
      final response = await remoteDataSource.readBanners(
          orderBy: orderBy,
          start: start,
          end: end,
          sort: sort,
      );
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, Banner>> readBannerById({
    @required int id,
  }) async {
    try{
      final response = await remoteDataSource.readBannerById(
        id: id,
      );
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Banner>> createBanner({
    @required Banner banner,
  }) async {
    try{
      final session = await localDataSource.getCachedSession();
      final response = await remoteDataSource.createBanner(
        session: session,
        banner: banner,
      );
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Banner>> updateBanner({
    @required int id,
    @required Banner banner,
  }) async {
    try{
      final session = await localDataSource.getCachedSession();
      final response = await remoteDataSource.updateBanner(
        session: session,
        id: id,
        banner: banner,
      );
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Banner>> updateActivationOfBanner({
    @required int id,
    @required bool activation,
  }) async {
    try{
      final session = await localDataSource.getCachedSession();
      final response = await remoteDataSource.updateActivationOfBanner(
        session: session,
        id: id,
        activation: activation,
      );
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, void>> deleteBanner({
    @required int id,
  }) async {
    try{
      final session = await localDataSource.getCachedSession();
      final response = await remoteDataSource.deleteBanner(
        session: session,
        id: id,
      );
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}