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

  // use cases
  sl.registerLazySingleton(() => CheckInputValidationUseCase(sl()));

  sl.registerLazySingleton(() => SignInUseCase(sl()));

  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  sl.registerLazySingleton(() => SignOutUseCase(sl()));

  // repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      // networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(
      client: sl(),
      sharedPreferences: sl(),
    ),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
          () => AuthLocalDataSourceImpl(
        sharedPreferences: sl(),
      )
  );

  //! Core
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}