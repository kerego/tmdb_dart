part of 'tmdb-service.dart';

abstract class MovieService {
  Configuration _configuration;
  String _apiKey;

  Future<PagedResult<MovieBase>> searchMovies(String query, {int page}) {
    var settings = new MovieSearchSettings(query: query, page: page);
    return advancedSearchMovies(settings);
  }

  Future<PagedResult<MovieBase>> advancedSearchMovies(
      MovieSearchSettings settings) {
    assert(settings.query != null);
    return _fetchPagedResult(settings, "3/search/movie");
  }

  Future<PagedResult<MovieBase>> getTopRatedMovies(
          MovieSearchSettings settings) =>
      _fetchPagedResult(settings, "3/movie/top_rated");

  Future<PagedResult<MovieBase>> getPopularMovies(
          MovieSearchSettings settings) =>
      _fetchPagedResult(settings, "3/movie/popular");

  Future<PagedResult<MovieBase>> getUpcomingMovies(
          MovieSearchSettings settings) =>
      _fetchPagedResult(settings, "3/movie/upcoming");

  Future<PagedResult<MovieBase>> getNowPlayingMovies(
          MovieSearchSettings settings) =>
      _fetchPagedResult(settings, "3/movie/now_playing");

  Future<PagedResult<MovieBase>> getLatestMovies(
          MovieSearchSettings settings) =>
      _fetchPagedResult(settings, "3/movie/latest");

  Future<Movie> getMovie(int id,
      {String language = "en-US",
      List<String> imageLanguages = const ["en", null],
      MovieAppendSettings appendSettings,
      QualitySettings qualitySettings}) async {
    appendSettings = appendSettings ?? new MovieAppendSettings();
    qualitySettings = qualitySettings ?? new QualitySettings();

    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": imageLanguages.join(","),
      "append_to_response": appendSettings.toString()
    };

    Uri uri = _buildUri("3/movie/$id", queryParams);

    Response response = await getWithResilience(uri);

    if (response.statusCode != 200)
      throw new Exception("request status not successful");

    var map = json.decode(response.body);

    var assetResolver = new AssetResolver(_configuration, qualitySettings);

    var movie = new Movie.fromJson(map, assetResolver);
    return movie;
  }

  Future<Response> getWithResilience(Uri uri);

  Future<PagedResult<MovieBase>> _fetchPagedResult(
      MovieSearchSettings settings, String url) async {
    var queryParams = settings.toJson()..["api_key"] = _apiKey;
    Uri uri = _buildUri(url, queryParams);

    Response response = await getWithResilience(uri);

    if (response.statusCode != 200)
      throw new Exception("request status not successful");

    PagedResult<MovieBase> pagedResult =
        await _decodeToPagedResult(response, settings);

    return pagedResult;
  }

  Future<PagedResult<MovieBase>> _decodeToPagedResult(
      Response response, MovieSearchSettings settings) async {
    var map = json.decode(response.body);

    var assetResolver = new AssetResolver(_configuration, settings.quality);
    var movieBaseFactory =
        (json) => new MovieBase.fromJson(json, assetResolver);
    PagedResult<MovieBase> pagedResult =
        new PagedResult<MovieBase>.fromJson(map, movieBaseFactory);
    return pagedResult;
  }

  Uri _buildUri(String path, Map<String, dynamic> queryParams) {
    Uri uri = new Uri(
        scheme: "https",
        host: "api.themoviedb.org",
        path: path,
        queryParameters: queryParams);
    return uri;
  }
}
