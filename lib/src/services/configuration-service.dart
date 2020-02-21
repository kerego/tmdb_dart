part of 'tmdb-service.dart';

abstract class ConfigurationService {
  final String _configUrl = "https://api.themoviedb.org/3/configuration";

  Configuration _configuration;

  Configuration get configuration => _configuration;

  void set configuration(Configuration configuration) {
    assert(configuration != null);
    _configuration = configuration;
  }

  Future<Configuration> _initConfiguration(String apiKey) async {
    Response response = await get("$_configUrl?api_key=$apiKey");
    Map<String, dynamic> map = json.decode(response.body);
    _configuration = Configuration.fromJson(map);

    return _configuration;
  }
}
