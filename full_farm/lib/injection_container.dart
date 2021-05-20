import 'package:full_farm/core/network/network_info.dart';
import 'package:full_farm/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:full_farm/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:full_farm/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:full_farm/features/auth/domain/repositories/auth_repository.dart';
import 'package:full_farm/features/auth/domain/usecases/check_input_validation.dart';
import 'package:full_farm/features/auth/domain/usecases/sign_in.dart';
import 'package:full_farm/features/auth/domain/usecases/sign_out.dart';
import 'package:full_farm/features/auth/domain/usecases/sign_up.dart';
import 'package:full_farm/features/auth/presentation/provider/auth_provider.dart';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:full_farm/features/banner/data/datasources/banner_remote_data_source.dart';
import 'package:full_farm/features/banner/data/repositories/banner_repository_impl.dart';
import 'package:full_farm/features/banner/domain/repositories/banner_repository.dart';
import 'package:full_farm/features/banner/domain/usecase/create_banner.dart';
import 'package:full_farm/features/banner/domain/usecase/delete_banner.dart';
import 'package:full_farm/features/banner/domain/usecase/read_banner_by_id.dart';
import 'package:full_farm/features/banner/domain/usecase/read_banners.dart';
import 'package:full_farm/features/banner/domain/usecase/update_activation_of_banner.dart';
import 'package:full_farm/features/banner/domain/usecase/update_banner.dart';
import 'package:full_farm/features/banner/presentation/provider/banner_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Provider
  sl.registerLazySingleton(
        () => AuthProvider(
      checkInputValidationUseCase: sl(),
      signInUseCase: sl(),
      signUpUseCase: sl(),
      signOutUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => BannerProvider(
      readBannersUseCase: sl(),
      readBannerByIdUseCase: sl(),
      createBannerUseCase: sl(),
      updateBannerUseCase: sl(),
      updateActivationOfBannerUseCase: sl(),
      deleteBannerUseCase: sl(),
    ),
  );
  // use cases
  sl.registerLazySingleton(() => CheckInputValidationUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  sl.registerLazySingleton(() => ReadBannersUseCase(sl()));
  sl.registerLazySingleton(() => ReadBannerByIdUseCase(sl()));
  sl.registerLazySingleton(() => CreateBannerUseCase(sl()));
  sl.registerLazySingleton(() => UpdateBannerUseCase(sl()));
  sl.registerLazySingleton(() => UpdateActivationOfBannerUseCase(sl()));
  sl.registerLazySingleton(() => DeleteBannerUseCase(sl()));

  // repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      // networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<BannerRepository>(
        () => BannerRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<BannerRemoteDataSource>(
        () => BannerRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}