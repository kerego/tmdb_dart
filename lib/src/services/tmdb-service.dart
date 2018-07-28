import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:tmdb_dart/tmdb_dart.dart';

part 'configuration-service.dart';
part 'movie-service.dart';
part 'resilient-service.dart';

class TmdbService extends Object
    with MovieService, ConfigurationService, ResilientService {
  Configuration _configuration;
  final String _apiKey;

  TmdbService(this._apiKey) {}
}
