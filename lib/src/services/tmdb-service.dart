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
  final MovieService _movie;
  final TvService _tv;

  MovieService get movie {
    assert(configuration != null, "TmdbService not configured properly");
    return _movie;
  }

  TvService get tv {
    assert(configuration != null, "TmdbService not configured properly");
    return _tv;
  }

  @override
  set configuration(Configuration config) {
    assert(config != null);
    this._configuration = _movie._configuration = _tv._configuration = config;
  }

  /// Instanciate TmdbService using TMDB API Key (v3 auth)
  TmdbService(String apiKey)
      : assert(apiKey != null, "TMDB API Key can't be null."),
        _movie = MovieService(apiKey),
        _tv = TvService(apiKey),
        super(apiKey);
}
