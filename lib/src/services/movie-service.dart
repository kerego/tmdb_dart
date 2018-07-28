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

  Future<PagedResult<MovieBase>> _fetchPagedResult(
      MovieSearchSettings settings, String url) async {
    var queryParams = settings.toJson()..["api_key"] = _apiKey;
    Uri uri = _buildUri(url, queryParams);

    Response response = await getWithResilience(uri);

    PagedResult<MovieBase> pagedResult =
        await _decodeToPagedResult(response, settings);

    return pagedResult;
  }

  Future<Response> getWithResilience(Uri uri);

  Future<PagedResult<MovieBase>> _decodeToPagedResult(
      Response response, MovieSearchSettings settings) async {
    var map = json.decode(response.body);
    var movieBaseFactory =
        (json) => new MovieBase.fromJson(json, _configuration, settings);
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
