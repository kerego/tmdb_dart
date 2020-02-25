part of 'tmdb-service.dart';

class TvService with _CommonService<TvBase> {
  final Configuration _configuration;
  final String _apiKey;

  TvService(this._apiKey, this._configuration);

  Future<PagedResult<TvBase>> search(String query, {int page}) {
    var settings = TvSearchSettings(query: query, page: page);
    return advancedSearch(settings);
  }

  Future<PagedResult<TvBase>> advancedSearch(TvSearchSettings settings) {
    assert(settings.query != null && settings.query.isNotEmpty);
    return _fetchPagedResult(
      "3/search/tv",
      settings ?? const TvSearchSettings(),
    );
  }

  Future<PagedResult<TvBase>> discover({TvDiscoverSettings settings}) =>
      _fetchPagedResult(
          "3/discover/tv", settings ?? const TvDiscoverSettings());

  Future<PagedResult<TvBase>> getTopRated({TvSearchSettings settings}) =>
      _fetchPagedResult(
        "3/tv/top_rated",
        settings ?? const TvSearchSettings(),
      );

  Future<PagedResult<TvBase>> getPopular({TvSearchSettings settings}) =>
      _fetchPagedResult(
        "3/tv/popular",
        settings ?? const TvSearchSettings(),
      );

  Future<PagedResult<TvBase>> getAiringToday({TvSearchSettings settings}) =>
      _fetchPagedResult(
        "3/tv/airing_today",
        settings ?? const TvSearchSettings(),
      );

  Future<PagedResult<TvBase>> getOnTheAir({TvSearchSettings settings}) =>
      _fetchPagedResult(
        "3/tv/on_the_air",
        settings ?? const TvSearchSettings(),
      );

  Future<TvShow> getLatest(
          {String language, QualitySettings qualitySettings}) =>
      _getLatest<TvShow>(
        language ?? "en-US",
        qualitySettings ?? const QualitySettings(),
      );

  Future<TvShow> getDetails(
    int tvId, {
    String language,
    List<String> imageLanguages,
    AppendSettings appendSettings,
    QualitySettings qualitySettings,
  }) =>
      _getDetails<TvShow>(
        tvId,
        language ?? "en-US",
        imageLanguages ?? const ["en"],
        appendSettings ?? const AppendSettings(),
        qualitySettings ?? const QualitySettings(),
      );

  Future<TvSeason> getSeasonDetails(
    int tvId, {
    int seasonNumber,
    String language,
    List<String> imageLanguages,
    AppendSettings appendSettings,
    QualitySettings qualitySettings,
  }) {
    assert(tvId != null, "TvId can't be null");
    var queryParams = {
      "api_key": _apiKey,
      "language": language ?? "en-US",
      "include_image_language": (imageLanguages ?? const ["en"]).join(","),
      "append_to_response":
          (appendSettings ?? const AppendSettings()).toString()
    };

    return _get<TvSeason>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}",
      queryParams,
      qualitySettings ?? const QualitySettings(),
    );
  }

  Future<TvEpisode> getEpisodeDetails(
    int tvId, {
    int seasonNumber,
    int episodeNumber,
    String language,
    List<String> imageLanguages,
    AppendSettings appendSettings,
    QualitySettings qualitySettings,
  }) {
    assert(tvId != null, "TvId can't be null");
    var queryParams = {
      "api_key": _apiKey,
      "language": language ?? "en-US",
      "include_image_language": (imageLanguages ?? const ["en"]).join(","),
      "append_to_response":
          (appendSettings ?? const AppendSettings()).toString()
    };

    return _get<TvEpisode>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}/episode/${episodeNumber ?? 1}",
      queryParams,
      qualitySettings ?? const QualitySettings(),
    );
  }
}
