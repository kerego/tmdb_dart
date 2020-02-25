part of 'tmdb-service.dart';

abstract class ConfigurationService {
  static const String _configPath = "3/configuration";

  Configuration _configuration;
  String _apiKey;

  List<Country> _countries;

  Configuration get configuration => _configuration;

  set configuration(Configuration configuration) {
    assert(configuration != null);
    _configuration = configuration;
  }

  Future<Configuration> initConfiguration() async {
    Uri uri = _buildUri(
      "$_configPath",
      {"api_key": _apiKey},
    );
    Response response = await get(uri);

    Map<String, dynamic> map = json.decode(response.body);
    _configuration = Configuration.fromJson(map);

    return _configuration;
  }

  Future<List<Country>> getAllCountries() async {
    if (_countries == null) {
      Uri uri = _buildUri(
        "$_configPath/countries",
        {"api_key": _apiKey},
      );
      Response response = await ResilientService.getWithResilience(uri);

      if (response.statusCode != 200) {
        throw ClientException("request status not successful", uri);
      }
      List<dynamic> map = json.decode(response.body);

      _countries = Country.listFromJson(map);
    }
    return _countries;
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
    Response response = await ResilientService.getWithResilience(uri);

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
