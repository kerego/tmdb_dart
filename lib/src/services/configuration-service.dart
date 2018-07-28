part of 'tmdb-service.dart';

abstract class ConfigurationService {
  Configuration _configuration;

  String _configUrl = "https://api.themoviedb.org/3/configuration";
  String _apiKey;

  void provideConfiguration(String configuration) {
    var map = json.decode(configuration);
    _configuration = new Configuration.fromJson(map);
  }

  Future<String> initConfiguration() async {
    String url = "$_configUrl?api_key=$_apiKey";
    Response response = await get(url);
    Map<String, dynamic> map = json.decode(response.body);
    Configuration config = new Configuration.fromJson(map);

    _configuration = config;

    return json.encode(config);
  }

  String getPosterPath(String content) {
    return _configuration.getPosterPath(content);
  }
}
