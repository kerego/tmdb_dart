part of 'tmdb-service.dart';

abstract class ConfigurationService {
  final String _configUrl = "https://api.themoviedb.org/3/configuration";

  Configuration _configuration;
  String _apiKey;

  Configuration get configuration => _configuration;

  set configuration(Configuration configuration) {
    assert(configuration != null);
    _configuration = configuration;
  }

  Future<Configuration> initConfiguration() async {
    Response response = await get("$_configUrl?api_key=$_apiKey");
    Map<String, dynamic> map = json.decode(response.body);
    _configuration = Configuration.fromJson(map);

    return _configuration;
  }

  Future<List<Country>> getAllCountries() async {
    Response response = await get("$_configUrl/countries?api_key=$_apiKey");
    List<dynamic> map = json.decode(response.body);

    return Country.listFromJson(map);
  }
}
