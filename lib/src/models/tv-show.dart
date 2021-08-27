import '../settings/asset-resolver.dart';

import 'alternative-title.dart';
import 'video.dart';
import 'cast.dart';
import 'company.dart';
import 'content-base.dart';
import 'creator.dart';
import 'credits.dart';
import 'crew.dart';
import 'date.dart';
import 'external-info.dart';
import 'genre.dart';
import 'image-collection.dart';
import 'keyword.dart';

part 'tv-episode.dart';
part 'tv-season.dart';

class TvShow extends TvBase {
  final List<Creator> createdBy;
  final List<int> episodeRunTime;
  final List<Genre> genres;
  final String? homepage;
  final bool inProduction;
  final List<String> languages;
  final Date? lastAirDate;
  final dynamic lastEpisodeToAir;
  final List<Company> networks;
  final int numOfEpisodes;
  final int numOfSeasons;
  final List<Company> productionCompanies;
  final List<SeasonBase> seasons;
  final String? status, type;

  // append_to_response
  final ImageCollection? images;
  final List<AlternativeTitle> alternativeTitles;
  final Credits? credits;
  final ExternalInfo? externalIds;
  final List<Keyword> keywords;
  final List<Video> videos;
  final List<TvBase> recommendations;
  final List<TvBase> similar;

  TvShow({
    required int id,
    required String originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    num popularity = 0,
    int voteCount = 0,
    num voteAverage = 0,
    Date? firstAirDate,
    String name = '',
    String? originalName,
    List<String> originCountry = const [],
    List<int> genreIds = const [],
    this.createdBy = const [],
    this.episodeRunTime = const [],
    this.genres = const [],
    this.homepage,
    this.inProduction = false,
    this.languages = const [],
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.networks = const [],
    this.numOfEpisodes = 0,
    this.numOfSeasons = 0,
    this.productionCompanies = const [],
    this.seasons = const [],
    this.status,
    this.type,
    this.images,
    this.alternativeTitles = const [],
    this.credits,
    this.externalIds,
    this.keywords = const [],
    this.videos = const [],
    this.recommendations = const [],
    this.similar = const [],
  }) : super(
            id: id,
            originalLanguage: originalLanguage,
            backdropPath: backdropPath,
            posterPath: posterPath,
            overview: overview,
            popularity: popularity,
            voteCount: voteCount,
            voteAverage: voteAverage,
            firstAirDate: firstAirDate,
            name: name,
            originalName: originalName,
            originCountry: originCountry,
            genreIds: genreIds);

  factory TvShow.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      TvShow(
        id: map["id"],
        originalLanguage: map["original_language"],
        backdropPath: assetResolver.getBackdropPath(map["backdrop_path"]),
        posterPath: assetResolver.getPosterPath(map["poster_path"]),
        overview: map["overview"],
        popularity: map["popularity"] ?? 0,
        voteCount: map["vote_count"] ?? 0,
        voteAverage: map["vote_average"] ?? 0,
        firstAirDate: Date.tryParse(map["first_air_date"]),
        name: map["name"],
        originalName: map["original_name"],
        originCountry: List.castFrom(map["origin_country"] ?? []),
        createdBy: Creator.listFromJson(map["created_by"] ?? [], assetResolver),
        episodeRunTime: List.castFrom(map["episode_run_time"] ?? []),
        genres: Genre.listFromJson(map["genres"] ?? []),
        genreIds:
            Genre.listFromJson(map["genres"] ?? []).map((e) => e.id).toList(),
        homepage: map["homepage"],
        inProduction: map["in_production"] ?? false,
        languages: List.castFrom(map["languages"] ?? []),
        lastAirDate: Date.tryParse(map["last_air_date"]),
        lastEpisodeToAir: map["last_episode_to_air"] != null
            ? EpisodeBase.fromJson(map["last_episode_to_air"], assetResolver)
            : null,
        networks: Company.listFromJson(map["networks"] ?? [], assetResolver),
        numOfEpisodes: map["number_of_episodes"] ?? 0,
        numOfSeasons: map["number_of_seasons"] ?? 0,
        productionCompanies: Company.listFromJson(
            map["production_companies"] ?? [], assetResolver),
        seasons: SeasonBase.listFromJson(map["seasons"] ?? [], assetResolver),
        status: map["status"],
        type: map["type"],
        images: map.containsKey("images")
            ? ImageCollection.fromJson(map["images"], assetResolver)
            : null,
        alternativeTitles: map.containsKey("alternative_titles")
            ? AlternativeTitle.listFromJson(map["alternative_titles"]["titles"])
            : [],
        credits: map.containsKey("credits")
            ? Credits.fromJson(map["credits"], assetResolver)
            : null,
        externalIds: map.containsKey("external_ids")
            ? ExternalInfo.fromJson(map["external_ids"])
            : null,
        keywords: map.containsKey("keywords")
            ? Keyword.listFromJson(map["keywords"]["keywords"])
            : [],
        videos: map.containsKey("videos")
            ? Video.listFromJson(map["videos"]["results"])
            : [],
        recommendations: map.containsKey("recommendations")
            ? TvBase.listFromJson(
                map["recommendations"]["results"], assetResolver)
            : [],
        similar: map.containsKey("similar")
            ? TvBase.listFromJson(map["similar"]["results"], assetResolver)
            : [],
      );
}
