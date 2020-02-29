part of 'tmdb-service.dart';

abstract class _CommonService with ResilientService {
  final String _apiKey;
  Configuration _configuration;

  _CommonService(this._apiKey);

  Future<T> _get<T>(
    String path,
    Map<String, String> queryParams,
    QualitySettings qualitySettings,
    T fromJson(Map<String, dynamic> map, AssetResolver assetResolver),
  ) async {
    Uri uri = _buildUri(path, queryParams);

    Response response = await getWithResilience(uri);

    if (response.statusCode != 200) {
      throw ClientException("request status not successful", uri);
    }

    var map = json.decode(response.body);
    var assetResolver = AssetResolver(_configuration, qualitySettings);

    return fromJson(map, assetResolver);
  }

  Future<PagedResult<T>> _fetchPagedResult<T>(
    String url,
    SearchSettings settings,
    T fromJson(Map<String, dynamic> map, AssetResolver assetResolver),
  ) async {
    var queryParams = settings.toJson()..["api_key"] = _apiKey;
    Uri uri = _buildUri(url, queryParams);

    Response response = await getWithResilience(uri);

    if (response.statusCode != 200) {
      throw ClientException("request status not successful", uri);
    }

    return _decodeToPagedResult<T>(response, settings, fromJson);
  }

  PagedResult<T> _decodeToPagedResult<T>(
    Response response,
    SearchSettings settings,
    T fromJson(Map<String, dynamic> map, AssetResolver assetResolver),
  ) {
    var map = json.decode(response.body);
    var assetResolver = AssetResolver(_configuration, settings.quality);

    var baseFactory = (json) => fromJson(json, assetResolver);

    return PagedResult<T>.fromJson(map, baseFactory);
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
