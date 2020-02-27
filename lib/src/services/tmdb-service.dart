import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../models/content-base.dart';
import '../models/country.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import '../models/paged-result.dart';
import '../models/tv-show.dart';
import '../settings/append-settings.dart';
import '../settings/asset-resolver.dart';
import '../settings/configuration.dart';
import '../settings/search-settings.dart';
import '../settings/quality-settings.dart';

part 'common-service.dart';
part 'configuration-service.dart';
part 'movie-service.dart';
part 'resilient-service.dart';
part 'tv-service.dart';

class TmdbService extends ConfigurationService {
  final String _apiKey;

  TmdbService(this._apiKey)
      : assert(_apiKey != null, "TMDB API Key can't be null.");
}
