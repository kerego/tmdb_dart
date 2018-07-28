part of 'tmdb-service.dart';

abstract class MovieService {
  Configuration _configuration;
  String _apiKey;
  String _movieSearchUrl = "3/search/movie";

  Future<PagedResult<MovieBase>> searchMovies(String query, {int page}) async {
    var settings = new MovieSearchSettings(query, page: page);
    return searchMoviesAdvanced(settings);
  }

  Future<PagedResult<MovieBase>> searchMoviesAdvanced(
      MovieSearchSettings settings) async {
    var queryParams = settings.toJson()..["api_key"] = _apiKey;
    var uri = new Uri(
        scheme: "https",
        host: "api.themoviedb.org",
        path: _movieSearchUrl,
        queryParameters: queryParams);

    var response = await getWithResilience(uri);
    var map = json.decode(response.body);
    var movieBaseFactory =
        (json) => new MovieBase.fromJson(json, _configuration, settings);
    var pagedResult =
        new PagedResult<MovieBase>.fromJson(map, movieBaseFactory);
    return pagedResult;
  }

  Future<Response> getWithResilience(Uri uri);
}
