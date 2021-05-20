import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:full_farm/app/config.dart';
import 'package:full_farm/features/banner/data/model/banner_model.dart';
import 'package:full_farm/features/banner/domain/entities/banner.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';

abstract class BannerRemoteDataSource {
  Future<List<Banner>> readBanners({
    String orderBy,
    String start,
    String end,
    String sort,
  });

  Future<Banner> readBannerById({
    @required int id,
  });

  Future<Banner> createBanner({
    @required String session,
    @required Banner banner,
  });

  Future<Banner> updateBanner({
    @required String session,
    @required int id,
    @required Banner banner,
  });

  Future<Banner> updateActivationOfBanner({
    @required String session,
    @required int id,
    @required bool activation,
  });

  Future<void> deleteBanner({
    @required String session,
    @required int id,
  });
}

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final http.Client client;

  BannerRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<List<Banner>> readBanners({
    String orderBy,
    String start,
    String end,
    String sort,
  }) async {
    Map<String, String> queryParameters;
    if(orderBy != null)
      queryParameters["orderBy"] = orderBy;
    if(start != null)
      queryParameters["start"] = start;
    if(end != null)
      queryParameters["end"] = end;
    if(sort != null)
      queryParameters["sort"] = sort;

    Uri url = Uri.https(Config.API_BASE_URL, '/api/banner', queryParameters);

    final response = await client.get(
      url,
    );

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      return List<Banner>.from(l.map((jsonMap) =>
          BannerModel.fromJson(jsonMap))
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Banner> readBannerById({
    @required int id,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/banner/${id}');

    final response = await client.get(
      url,
    );

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      return BannerModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Banner> createBanner({
    @required String session,
    @required Banner banner,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/banner');

    Map<String, String> headers = {
      'Cookie': session,
    };

    Map<String, Object> body = {
      "title": banner.title,
      "description": banner.description,
      "type": banner.type,
      "image": banner.image,
      "startDate": banner.startDate,
      "endDate": banner.endDate,
    };

    var jsonBody = jsonEncode(body);

    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      return BannerModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Banner> updateBanner({
    @required String session,
    @required int id,
    @required Banner banner,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/banner/${id}');

    Map<String, String> headers = {
      'Cookie': session,
    };

    Map<String, Object> body = {
      "title": banner.title,
      "description": banner.description,
      "type": banner.type,
      "image": banner.image,
      "startDate": banner.startDate,
      "endDate": banner.endDate,
    };

    var jsonBody = jsonEncode(body);

    final response = await client.patch(
      url,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      return BannerModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Banner> updateActivationOfBanner({
    @required String session,
    @required int id,
    @required bool activation,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/banner/${id}/activate');

    Map<String, String> headers = {
      'Cookie': session,
    };

    Map<String, bool> body = {
      "activation": activation,
    };

    var jsonBody = jsonEncode(body);

    final response = await client.patch(
      url,
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      return BannerModel.fromJson(jsonMap);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteBanner({
    @required String session,
    @required int id,
  }) async {
    Uri url = Uri.https(Config.API_BASE_URL, '/api/banner/${id}');

    Map<String, String> headers = {
      'Cookie': session,
    };

    final response = await client.delete(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException();
    }
  }
}
