import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:full_farm/app/config.dart';
import 'package:full_farm/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<bool> checkInputValidation({
    String inputType,
    String input
  });

  Future<void> signUp({
    String userId,
    String password,
    String name,
    String email,
    String address
  });

  Future<Tuple2<String, UserModel>> signIn({
    String userId,
    String password
  });

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  AuthRemoteDataSourceImpl({
    @required this.client,
    @required this.sharedPreferences,
  });

  @override
  Future<bool> checkInputValidation({
    String inputType,
    String input
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/auth/check/${inputType}');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      inputType: input
    };
    var jsonBody = jsonEncode(body);

    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      return jsonMap['isDuplicated'];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp({
    String userId,
    String password,
    String name,
    String email,
    String address
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/auth/signup');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      'userId': userId,
      'password': password,
      'name': name,
      'email': email,
      'address': address
    };

    var jsonBody = jsonEncode(body);

    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      return UserModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }


  @override
  Future<Tuple2<String, UserModel>> signIn({
    String userId,
    String password
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/auth/signin');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      "userId": userId,
      "password": password,
    };

    var jsonBody = jsonEncode(body);

    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      final session = response.headers['Set-Cookie'];
      var jsonMap = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(jsonMap);
      return Tuple2(session, userModel);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/auth/signout');

    Map<String, String> headers = {
      'Cookie': 'application/json',
    };

    final response = await client.post(
      url,
      headers: headers,
      body: null,
    );

    if (response.statusCode == 200) {

    } else {
      throw ServerException();
    }
  }
}
