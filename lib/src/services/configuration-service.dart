part of 'tmdb-service.dart';

abstract class ConfigurationService with ResilientService {
  static const String _configPath = "3/configuration";

  Configuration _configuration;
  String _apiKey;

  MovieService _movie;
  TvService _tv;

  MovieService get movie {
    assert(configuration != null, "TmdbService not configured properly");
    return _movie;
  }

  TvService get tv {
    assert(configuration != null, "TmdbService not configured properly");
    return _tv;
  }

  Configuration get configuration => _configuration;

  set configuration(Configuration config) {
    assert(config != null);
    _configuration = config;
    _movie = MovieService(_apiKey, _configuration);
    _tv = TvService(_apiKey, _configuration);
  }

  Future<Configuration> initConfiguration() async {
    Uri uri = _buildUri(
      "$_configPath",
      {"api_key": _apiKey},
    );
    Response response = await get(uri);

    Map<String, dynamic> map = json.decode(response.body);
    return configuration = Configuration.fromJson(map);
  }

  Future<List<Country>> getAllCountries() async {
    Uri uri = _buildUri(
      "$_configPath/countries",
      {"api_key": _apiKey},
    );
    Response response = await getWithResilience(uri);

    if (response.statusCode != 200) {
      throw ClientException("request status not successful", uri);
    }
    List<dynamic> map = json.decode(response.body);

    return Country.listFromJson(map);
  }

  Future<List<Genre>> getAllMovieGenres({String language}) =>
      _getAllGenres("movie", language ?? "en-US");

  Future<List<Genre>> getAllTvGenres({String language}) =>
      _getAllGenres("tv", language ?? "en-US");

  Future<List<Genre>> _getAllGenres(String type, String language) async {
    Uri uri = _buildUri(
      "3/genre/$type/list",
      {"api_key": _apiKey, "language": language},
    );
    Response response = await getWithResilience(uri);

    if (response.statusCode != 200) {
      throw ClientException("request status not successful", uri);
    }
    Map<String, dynamic> map = json.decode(response.body);

    return Genre.listFromJson(map["genres"]);
  }

  static Uri _buildUri(
    String path,
    Map<String, dynamic> queryParams,
  ) =>
      Uri(
        scheme: "https",
        host: "api.themoviedb.org",
        path: path,
        queryParameters: queryParams,
      );
}
