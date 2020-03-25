part of 'tmdb-service.dart';

class MovieService extends _CommonService {
  MovieService(String apiKey) : super(apiKey);

  Future<PagedResult<MovieBase>> search(String query, {int page}) {
    var settings = MovieSearchSettings(query: query);
    return advancedSearch(settings, page: page);
  }

  Future<PagedResult<MovieBase>> advancedSearch(MovieSearchSettings settings,
      {int page}) {
    assert(settings.query != null && settings.query.isNotEmpty);
    return _fetchPagedResult<MovieBase>(
      "3/search/movie",
      settings ?? const MovieSearchSettings(),
      (map, assetResolver) => MovieBase.fromJson(map, assetResolver),
      page ?? 1,
    );
  }

  Future<PagedResult<MovieBase>> discover(
          {MovieDiscoverSettings settings, int page}) =>
      _fetchPagedResult<MovieBase>(
        "3/discover/movie",
        settings ?? const MovieDiscoverSettings(),
        (map, assetResolver) => MovieBase.fromJson(map, assetResolver),
        page ?? 1,
      );

  Future<PagedResult<MovieBase>> getTopRated(
          {MovieSearchSettings settings, int page}) =>
      _fetchPagedResult<MovieBase>(
        "3/movie/top_rated",
        settings ?? const MovieSearchSettings(),
        (map, assetResolver) => MovieBase.fromJson(map, assetResolver),
        page ?? 1,
      );

  Future<PagedResult<MovieBase>> getPopular(
          {MovieSearchSettings settings, int page}) =>
      _fetchPagedResult<MovieBase>(
        "3/movie/popular",
        settings ?? const MovieSearchSettings(),
        (map, assetResolver) => MovieBase.fromJson(map, assetResolver),
        page ?? 1,
      );

  Future<PagedResult<MovieBase>> getUpComing(
          {MovieSearchSettings settings, int page}) =>
      _fetchPagedResult<MovieBase>(
        "3/movie/upcoming",
        settings ?? const MovieSearchSettings(),
        (map, assetResolver) => MovieBase.fromJson(map, assetResolver),
        page ?? 1,
      );

  Future<PagedResult<MovieBase>> getNowPlaying(
          {MovieSearchSettings settings, int page}) =>
      _fetchPagedResult<MovieBase>(
        "3/movie/now_playing",
        settings ?? const MovieSearchSettings(),
        (map, assetResolver) => MovieBase.fromJson(map, assetResolver),
        page ?? 1,
      );

  Future<Movie> getLatest({String language, QualitySettings qualitySettings}) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language ?? "en-US",
    };

    return _get<Movie>(
      "3/movie/latest",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => Movie.fromJson(map, assetResolver),
    );
  }

  Future<List<Video>> getVideos(
    int id, {
    String language,
  }) {
    assert(id != null, "ID can't be null");
    var queryParams = {
      "api_key": _apiKey,
      "language": language ?? "en-US",
    };

    return _get<List<Video>>(
      "3/movie/$id/videos",
      queryParams,
      null,
      (map, assetResolver) => Video.listFromJson(map["results"]),
    );
  }

  Future<Movie> getDetails(
    int id, {
    String language,
    List<String> imageLanguages,
    AppendSettings appendSettings,
    QualitySettings qualitySettings,
  }) {
    assert(id != null, "ID can't be null");
    var queryParams = {
      "api_key": _apiKey,
      "language": language ?? "en-US",
      "include_image_language": (imageLanguages ?? const ["en"]).join(","),
      "append_to_response":
          (appendSettings ?? const AppendSettings()).toString()
    };

    return _get<Movie>(
      "3/movie/$id",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => Movie.fromJson(map, assetResolver),
    );
  }
}
