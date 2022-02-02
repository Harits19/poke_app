import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_app/models/api_response.dart';
import 'package:github_app/models/gift.dart';
import 'package:github_app/utils/api_config.dart';

class GiftApi {
  GiftApi(this._dio);

  late final Dio _dio;

  getGifts({
    required ValueChanged<List<Gift>> onSuccess,
    required ValueChanged<String> onError,
    required int page,
  }) async {
    try {
      final response = await _dio.get(
        "/gifts",
        queryParameters: ApiConfig.toParameter(page),
      );
      final stringResponse = jsonDecode(response.data);
      final parsed = ApiResponse.fromJson(stringResponse);
      if (parsed.data == null) {
        onError("Unexpected Error");
        return;
      }
      final result = parsed.data!
          .map((dynamic e) => Gift.fromJson(e as Map<String, dynamic>))
          .toList();
      onSuccess(result);
    } on DioError catch (e) {
      onError(e.message);
    } on Exception catch (e) {
      onError(e.toString());
    }
  }

  getDetailGifts({
    required ValueChanged<Gift> onSuccess,
    required ValueChanged<String> onError,
    required String id,
  }) async {
    try {
      final response = await _dio.get(
        "/gifts/$id",
      );
      final parsed = jsonDecode(response.data);
      final result = Gift.fromJson(parsed);
      onSuccess(result);
    } on DioError catch (e) {
      onError(e.message);
    } on Exception catch (e) {
      onError(e.toString());
    }
  }
}
