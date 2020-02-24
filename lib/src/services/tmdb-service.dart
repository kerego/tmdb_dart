import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../models/country.dart';
import '../models/genre.dart';
import '../models/movie-base.dart';
import '../models/movie.dart';
import '../models/paged-result.dart';
import '../settings/asset-resolver.dart';
import '../settings/configuration.dart';
import '../settings/movie-append-settings.dart';
import '../settings/movie-search-settings.dart';
import '../settings/quality-settings.dart';

part 'configuration-service.dart';
part 'movie-service.dart';
part 'resilient-service.dart';

class TmdbService extends Object
    with MovieService, ConfigurationService, ResilientService {
  final String _apiKey;

  TmdbService(this._apiKey)
      : assert(_apiKey != null, "TMDB API Key can't be null.");
}
