part of 'tmdb-service.dart';

abstract class ConfigurationService with ResilientService {
  static const String _configPath = "3/configuration";

  final String _apiKey;
  Configuration _configuration;

  ConfigurationService(this._apiKey);

  Configuration get configuration => _configuration;

  set configuration(Configuration config);

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
      _getAllGenres("movie", language);

  Future<List<Genre>> getAllTvGenres({String language}) =>
      _getAllGenres("tv", language);

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
        queryParameters: queryParams..removeWhere((_, value) => value == null),
      );
}
