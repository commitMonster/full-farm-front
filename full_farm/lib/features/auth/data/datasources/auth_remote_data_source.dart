import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:full_farm/app/config.dart';
import 'package:full_farm/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<bool> checkInputValidation({
    @required String inputType,
    @required String input,
  });

  Future<void> signUp({
    @required String userId,
    @required String password,
    @required String name,
    @required String email,
    String address,
  });

  Future<Tuple2<String, UserModel>> signIn({
    @required String userId,
    @required String password,
  });

  Future<void> signOut({
    @required String session,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<bool> checkInputValidation({
    String inputType,
    String input,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/auth/check/${inputType}');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    Map<String, String> body = {
      inputType: input,
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
    String address,
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
      'address': address,
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
    String password,
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
  Future<void> signOut({
    String session,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/auth/signout');

    Map<String, String> headers = {
      'Cookie': session,
    };

    final response = await client.post(
      url,
      headers: headers,
      body: null,
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException();
    }
  }
}
