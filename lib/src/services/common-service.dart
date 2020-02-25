part of 'tmdb-service.dart';

abstract class _CommonService<T> {
  Configuration _configuration;
  String _apiKey;

  String get type {
    switch (T) {
      case TvBase:
        return "tv";
      case MovieBase:
        return "movie";
      default:
        throw AssertionError("Invalid type used!");
    }
  }

  Future<R> _getLatest<R>(
    String language,
    QualitySettings qualitySettings,
  ) async {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
    };

    return _get("3/$type/latest", queryParams, qualitySettings);
  }

  Future<R> _getDetails<R>(
    int id,
    String language,
    List<String> imageLanguages,
    AppendSettings appendSettings,
    QualitySettings qualitySettings,
  ) {
    assert(id != null, "ID can't be null");
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": imageLanguages.join(","),
      "append_to_response": appendSettings.toString()
    };

    return _get<R>("3/$type/$id", queryParams, qualitySettings);
  }

  Future<R> _get<R>(
    String path,
    Map<String, String> queryParams,
    QualitySettings qualitySettings,
  ) async {
    Uri uri = _buildUri(path, queryParams);

    Response response = await ResilientService.getWithResilience(uri);

    if (response.statusCode != 200) {
      throw ClientException("request status not successful", uri);
    }

    var map = json.decode(response.body);
    var assetResolver = AssetResolver(_configuration, qualitySettings);

    var details;
    switch (R) {
      case Movie:
        details = Movie.fromJson(map, assetResolver);
        break;
      case TvShow:
        details = TvShow.fromJson(map, assetResolver);
        break;
      case TvSeason:
        details = TvSeason.fromJson(map, assetResolver);
        break;
      case TvEpisode:
        details = TvEpisode.fromJson(map, assetResolver);
        break;
      default:
        throw AssertionError("Invalid type used!");
    }
    return details;
  }

  Future<PagedResult<T>> _fetchPagedResult(
    String url,
    SearchSettings settings,
  ) async {
    var queryParams = settings.toJson()..["api_key"] = _apiKey;
    Uri uri = _buildUri(url, queryParams);

    Response response = await ResilientService.getWithResilience(uri);

    if (response.statusCode != 200) {
      throw ClientException("request status not successful", uri);
    }

    return _decodeToPagedResult<T>(response, settings);
  }

  Future<PagedResult<T>> _decodeToPagedResult<T>(
    Response response,
    SearchSettings settings,
  ) async {
    var map = json.decode(response.body);
    var assetResolver = AssetResolver(_configuration, settings.quality);

    var baseFactory;
    switch (T) {
      case MovieBase:
        baseFactory = (json) => MovieBase.fromJson(json, assetResolver);
        break;
      case TvBase:
        baseFactory = (json) => TvBase.fromJson(json, assetResolver);
        break;
      default:
        throw AssertionError("Invalid type used!");
    }
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
