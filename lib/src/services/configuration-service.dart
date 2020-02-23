part of 'tmdb-service.dart';

abstract class ConfigurationService {
  final String _configPath = "3/configuration";

  Configuration _configuration;
  String _apiKey;

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
    Uri uri = _buildUri(
      "$_configPath/countries",
      {"api_key": _apiKey},
    );
    Response response = await getWithResilience(uri);

    if (response.statusCode != 200)
      throw ClientException("request status not successful", uri);

    List<dynamic> map = json.decode(response.body);

    return Country.listFromJson(map);
  }

  Future<List<Genre>> getAllMovieGenres({String language = "en-US"}) async {
    Uri uri = _buildUri(
      "3/genre/movie/list",
      {"api_key": _apiKey, "language": language},
    );
    Response response = await getWithResilience(uri);

    if (response.statusCode != 200)
      throw ClientException("request status not successful", uri);

    Map<String, dynamic> map = json.decode(response.body);

    return Genre.listFromJson(map["genres"]);
  }

  Uri _buildUri(String path, Map<String, dynamic> queryParams);

  Future<Response> getWithResilience(Uri uri);
}
