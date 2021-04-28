import 'package:dartz/dartz.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:full_farm/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:full_farm/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:full_farm/features/auth/domain/entities/user.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> checkInputValidation({
    String inputType,
    String input
  }) async {
    try{
      final isValidate = await remoteDataSource.checkInputValidation(
        inputType: inputType,
        input: input,
      );
      return Right(isValidate);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    String userId,
    String password,
    String name,
    String email,
    String address
  }) async {
    if(await networkInfo.isConnected){
      try{
        final signUp = await remoteDataSource.signUp(
            userId: userId,
            password: password,
            name: name,
            email: email,
            address: address
        );
        return Right(signUp);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw NetworkFailure();
    }
  }

  @override
  Future<Either<Failure, User>> signIn({
    String userId,
    String password
  }) async {
    if(await networkInfo.isConnected){
      try{
        final signIn = await remoteDataSource.signIn(
          userId: userId,
          password: password
        );
        final token = signIn.value1;
        await localDataSource.cacheToken(token);
        final user = signIn.value2;
        await localDataSource.cacheUser(user);
        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw NetworkFailure();
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try{
      final signOut = await remoteDataSource.signOut();
      await localDataSource.removeCachedToken();
      await localDataSource.removeCachedUser();
      return Right(signOut);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}