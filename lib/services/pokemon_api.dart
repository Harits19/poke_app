import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_app/models/api_response.dart';
import 'package:github_app/models/pokemon.dart';
import 'package:github_app/utils/api_config.dart';

class PokemonApi {
  final Dio _dio = ApiConfig.createInstance();

  getPokemon({
    required ValueChanged<List<Pokemon>> onSuccess,
    required ValueChanged<String> onError,
    required int pageKey,
  }) async {
    try {
      final response = await _dio.get("/pokemon", queryParameters: {
        "offset": (20 * pageKey),
        "limit": 20,
      });
      final responseParsed = ApiResponse.fromJson(response.data);

      final result = (responseParsed.results as List? ?? [])
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<Pokemon>();
      onSuccess(result);
    } on DioError catch (e) {
      onError(e.message);
    } on Exception catch (e) {
      onError(e.toString());
    }
  }

  getTypePokemon({
    required String name,
  }) {}
}
