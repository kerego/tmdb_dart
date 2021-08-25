part of 'tmdb-service.dart';

class TvService extends _CommonService {
  TvService(String? apiKey) : super(apiKey);

  Future<PagedResult<TvBase>> search(String query, {int? page}) {
    var settings = TvSearchSettings(query: query);
    return advancedSearch(settings, page: page);
  }

  Future<PagedResult<TvBase>> advancedSearch(TvSearchSettings? settings, {int? page}) {
    assert(settings?.query != null && settings!.query!.isNotEmpty);
    return _fetchPagedResult<TvBase>(
      "3/search/tv",
      settings ?? const TvSearchSettings(),
      (map, assetResolver) => TvBase.fromJson(map, assetResolver),
      page,
    );
  }

  Future<PagedResult<TvBase>> discover({TvDiscoverSettings? settings, int? page}) => _fetchPagedResult<TvBase>(
        "3/discover/tv",
        settings ?? const TvDiscoverSettings(),
        (map, assetResolver) => TvBase.fromJson(map, assetResolver),
        page,
      );

  Future<PagedResult<TvBase>> getTopRated({TvSearchSettings? settings, int? page}) => _fetchPagedResult<TvBase>(
        "3/tv/top_rated",
        settings ?? const TvSearchSettings(),
        (map, assetResolver) => TvBase.fromJson(map, assetResolver),
        page,
      );

  Future<PagedResult<TvBase>> getPopular({TvSearchSettings? settings, int? page}) => _fetchPagedResult<TvBase>(
        "3/tv/popular",
        settings ?? const TvSearchSettings(),
        (map, assetResolver) => TvBase.fromJson(map, assetResolver),
        page,
      );

  Future<PagedResult<TvBase>> getAiringToday({TvSearchSettings? settings, int? page}) => _fetchPagedResult<TvBase>(
        "3/tv/airing_today",
        settings ?? const TvSearchSettings(),
        (map, assetResolver) => TvBase.fromJson(map, assetResolver),
        page,
      );

  Future<PagedResult<TvBase>> getOnTheAir({TvSearchSettings? settings, int? page}) => _fetchPagedResult<TvBase>(
        "3/tv/on_the_air",
        settings ?? const TvSearchSettings(),
        (map, assetResolver) => TvBase.fromJson(map, assetResolver),
        page,
      );

  Future<TvShow> getLatest({String? language, QualitySettings? qualitySettings}) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
    };

    return _get<TvShow>(
      "3/tv/latest",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => TvShow.fromJson(map!, assetResolver!),
    );
  }

  Future<List<Video>> getVideos(
    int tvId, {
    String? language,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
    };

    return _get<List<Video>>(
      "3/tv/$tvId/videos",
      queryParams,
      null,
      (map, assetResolver) => Video.listFromJson(map!["results"] as List<dynamic>),
    );
  }

  Future<ImageCollection> getImages(
    int tvId, {
    String? language,
    List<String>? includeImageLanguage,
    QualitySettings? qualitySettings,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": includeImageLanguage?.join(',')
    };

    return _get<ImageCollection>(
      "3/tv/$tvId/images",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => ImageCollection.fromJson(map, assetResolver!),
    );
  }

  Future<TvShow> getDetails(
    int tvId, {
    String? language,
    List<String>? imageLanguages,
    AppendSettings? appendSettings,
    QualitySettings? qualitySettings,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": imageLanguages?.join(","),
      "append_to_response": appendSettings?.toString()
    };

    return _get<TvShow>(
      "3/tv/$tvId",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => TvShow.fromJson(map!, assetResolver!),
    );
  }

  Future<List<Video>> getSeasonVideos(
    int tvId, {
    int? seasonNumber,
    String? language,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
    };

    return _get<List<Video>>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}/videos",
      queryParams,
      null,
      (map, assetResolver) => Video.listFromJson(map!["results"] as List<dynamic>),
    );
  }

  Future<List<ImageInfo>> getSeasonImages(
    int tvId, {
    int? seasonNumber,
    String? language,
    List<String>? includeImageLanguage,
    QualitySettings? qualitySettings,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": includeImageLanguage?.join(',')
    };

    return _get<List<ImageInfo>>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}/images",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => ImageInfo.listFromJson(map!["posters"] as List<dynamic>, assetResolver!.getPosterPath),
    );
  }

  Future<TvSeason> getSeasonDetails(
    int tvId, {
    int? seasonNumber,
    String? language,
    List<String>? imageLanguages,
    AppendSettings? appendSettings,
    QualitySettings? qualitySettings,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": imageLanguages?.join(","),
      "append_to_response": appendSettings?.toString()
    };

    return _get<TvSeason>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => TvSeason.fromJson(map!, assetResolver!),
    );
  }

  Future<List<Video>> getEpisodeVideos(
    int tvId, {
    int? seasonNumber,
    int? episodeNumber,
    String? language,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
    };

    return _get<List<Video>>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}/episode/${episodeNumber ?? 1}/videos",
      queryParams,
      null,
      (map, assetResolver) => Video.listFromJson(map!["results"] as List<dynamic>),
    );
  }

  Future<List<ImageInfo>> getEpisodeImages(
    int tvId, {
    int? seasonNumber,
    int? episodeNumber,
    String? language,
    List<String>? includeImageLanguage,
    QualitySettings? qualitySettings,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": includeImageLanguage?.join(',')
    };

    return _get<List<ImageInfo>>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}/episode/${episodeNumber ?? 1}/images",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => ImageInfo.listFromJson(map!["stills"] as List<dynamic>, assetResolver!.getStillPath),
    );
  }

  Future<TvEpisode> getEpisodeDetails(
    int tvId, {
    int? seasonNumber,
    int? episodeNumber,
    String? language,
    List<String>? imageLanguages,
    AppendSettings? appendSettings,
    QualitySettings? qualitySettings,
  }) {
    var queryParams = {
      "api_key": _apiKey,
      "language": language,
      "include_image_language": imageLanguages?.join(","),
      "append_to_response": appendSettings?.toString()
    };

    return _get<TvEpisode>(
      "3/tv/$tvId/season/${seasonNumber ?? 0}/episode/${episodeNumber ?? 1}",
      queryParams,
      qualitySettings ?? const QualitySettings(),
      (map, assetResolver) => TvEpisode.fromJson(map!, assetResolver!),
    );
  }
}
