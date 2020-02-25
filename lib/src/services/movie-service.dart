part of 'tmdb-service.dart';

class MovieService with _CommonService<MovieBase> {
  final Configuration _configuration;
  final String _apiKey;

  MovieService(this._apiKey, this._configuration);

  Future<PagedResult<MovieBase>> search(String query, {int page}) {
    var settings = MovieSearchSettings(query: query, page: page);
    return advancedSearch(settings);
  }

  Future<PagedResult<MovieBase>> advancedSearch(MovieSearchSettings settings) {
    assert(settings.query != null && settings.query.isNotEmpty);
    return _fetchPagedResult(
      "3/search/movie",
      settings ?? const MovieSearchSettings(),
    );
  }

  Future<PagedResult<MovieBase>> discover({MovieDiscoverSettings settings}) =>
      _fetchPagedResult(
        "3/discover/movie",
        settings ?? const MovieDiscoverSettings(),
      );

  Future<PagedResult<MovieBase>> getTopRated({MovieSearchSettings settings}) =>
      _fetchPagedResult(
        "3/movie/top_rated",
        settings ?? const MovieSearchSettings(),
      );

  Future<PagedResult<MovieBase>> getPopular({MovieSearchSettings settings}) =>
      _fetchPagedResult(
        "3/movie/popular",
        settings ?? const MovieSearchSettings(),
      );

  Future<PagedResult<MovieBase>> getUpComing({MovieSearchSettings settings}) =>
      _fetchPagedResult(
        "3/movie/upcoming",
        settings ?? const MovieSearchSettings(),
      );

  Future<PagedResult<MovieBase>> getNowPlaying(
          {MovieSearchSettings settings}) =>
      _fetchPagedResult(
        "3/movie/now_playing",
        settings ?? const MovieSearchSettings(),
      );

  Future<Movie> getLatest({String language, QualitySettings qualitySettings}) =>
      _getLatest<Movie>(
        language ?? "en-US",
        qualitySettings ?? const QualitySettings(),
      );

  Future<Movie> getDetails(
    int id, {
    String language,
    List<String> imageLanguages,
    AppendSettings appendSettings,
    QualitySettings qualitySettings,
  }) =>
      _getDetails<Movie>(
        id,
        language ?? "en-US",
        imageLanguages ?? const ["en"],
        appendSettings ?? const AppendSettings(),
        qualitySettings ?? const QualitySettings(),
      );
}
