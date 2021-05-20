import 'dart:convert';
import 'package:full_farm/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<String> getCachedSession();

  Future<UserModel> getCachedUser();

  Future<void> cacheSession(String session);

  Future<void> cacheUser(UserModel userModel);

  Future<bool> removeCachedSession();

  Future<bool> removeCachedUser();
}

const CACHED_USER = 'CACHED_USER';
const CACHED_SESSION = 'CACHED_SESSION';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({
    @required this.sharedPreferences
  });

  @override
  Future<void> cacheSession(String session) {
    return sharedPreferences.setString(
      CACHED_SESSION,
      session,
    );
  }

  @override
  Future<void> cacheUser(UserModel userModel) {
    return sharedPreferences.setString(
      CACHED_USER,
      json.encode(userModel.toJson()),
    );
  }

  @override
  Future<String> getCachedSession() {
    final session = sharedPreferences.getString(CACHED_SESSION);
    if (session != null) {
      return Future.value(session);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<UserModel> getCachedUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> removeCachedSession() {
    final session = sharedPreferences.getString(CACHED_SESSION);
    if (session != null) {
      sharedPreferences.remove(CACHED_SESSION);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<bool> removeCachedUser() {
    final session = sharedPreferences.getString(CACHED_USER);
    if (session != null) {
      sharedPreferences.remove(CACHED_USER);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
