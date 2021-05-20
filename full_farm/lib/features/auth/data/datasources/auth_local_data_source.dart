import 'dart:convert';
import 'package:full_farm/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthLocalDataSource {
  Future<String> getCachedToken();

  Future<UserModel> getCachedUser();

  Future<void> cacheToken(String token);

  Future<void> cacheUser(UserModel userModel);

  Future<bool> removeCachedToken();

  Future<bool> removeCachedUser();
}

const CACHED_USER = 'CACHED_USER';
const CACHED_TOKEN = 'CACHED_TOKEN';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({
    @required this.sharedPreferences
  });

  @override
  Future<void> cacheToken(String token) {
    return sharedPreferences.setString(
      CACHED_TOKEN,
      token,
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
  Future<String> getCachedToken() {
    final token = sharedPreferences.getString(CACHED_TOKEN);
    if (token != null) {
      return Future.value(token);
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
  Future<bool> removeCachedToken() {
    final token = sharedPreferences.getString(CACHED_TOKEN);
    if (token != null) {
      sharedPreferences.remove(CACHED_TOKEN);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<bool> removeCachedUser() {
    final token = sharedPreferences.getString(CACHED_USER);
    if (token != null) {
      sharedPreferences.remove(CACHED_USER);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
