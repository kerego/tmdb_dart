import '../settings/asset-resolver.dart';
import 'alternative-title.dart';
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
import 'video.dart';
import 'watch-provider.dart';

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
  final EpisodeBase? lastEpisodeToAir;
  final List<Company> networks;
  final int numOfEpisodes;
  final int numOfSeasons;
  final List<Company> productionCompanies;
  final List<SeasonBase> seasons;
  final String? status;
  final String? type;

  // append_to_response
  final ImageCollection? images;
  final List<AlternativeTitle> alternativeTitles;
  final Credits? credits;
  final ExternalInfo? externalIds;
  final List<Keyword> keywords;
  final List<Video> videos;
  final List<TvBase> recommendations;
  final List<TvBase> similar;

  // The key represents a country code (more details there: https://developers.themoviedb.org/3/movies/get-movie-watch-providers)
  final Map<String, WatchProviders> watchProviders;

  TvShow({
    required int id,
    required String originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    num? popularity,
    int? voteCount,
    num? voteAverage,
    Date? firstAirDate,
    String? name,
    String? originalName,
    List<String> originCountry = const [],
    List<int> genreIds = const [],
    this.createdBy = const [],
    this.episodeRunTime = const [],
    this.genres = const [],
    this.homepage,
    bool? inProduction,
    this.languages = const [],
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.networks = const [],
    int? numOfEpisodes,
    int? numOfSeasons,
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
    this.watchProviders = const {},
  })  : numOfEpisodes = numOfEpisodes ?? 0,
        numOfSeasons = numOfSeasons ?? 0,
        inProduction = inProduction ?? false,
        super(
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
        popularity: map["popularity"],
        voteCount: map["vote_count"],
        voteAverage: map["vote_average"],
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
        inProduction: map["in_production"],
        languages: List.castFrom(map["languages"] ?? []),
        lastAirDate: Date.tryParse(map["last_air_date"]),
        lastEpisodeToAir: map["last_episode_to_air"] != null
            ? EpisodeBase.fromJson(map["last_episode_to_air"], assetResolver)
            : null,
        networks: Company.listFromJson(map["networks"] ?? [], assetResolver),
        numOfEpisodes: map["number_of_episodes"],
        numOfSeasons: map["number_of_seasons"],
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
        watchProviders: map.containsKey("watch/providers")
            ? WatchProviders.mapFromJson(map["watch/providers"]["results"])
            : {},
      );

  Map<String, dynamic> toMap() {
    final _toMap = {
      'created_by': this.createdBy.map((e) => e.toMap()).toList(),
      'episodeRunTime': this.episodeRunTime,
      'genres': this.genres.map((e) => e.toMap()).toList(),
      'homepage': this.homepage,
      'inProduction': this.inProduction,
      'languages': this.languages,
      'last_air_date': this.lastAirDate.toString(),
      'last_episode_to_air': this.lastEpisodeToAir?.toMap(),
      'networks': this.networks.map((e) => e.toMap()).toList(),
      'number_of_episodes': this.numOfEpisodes,
      'number_of_seasons': this.numOfSeasons,
      'production_companies': this.productionCompanies.map((e) {
        return e.toMap();
      }).toList(),
      'seasons': this.seasons.map((e) => e.toMap()).toList(),
      'status': this.status,
      'type': this.type,
      'images': this.images,
      'alternative_titles': this.alternativeTitles.map((e) {
        return e.toMap();
      }).toList(),
      'credits': this.credits?.toMap(),
      'externalIds': this.externalIds?.toMap(),
      'keywords': this.keywords.map((e) => e.toMap()).toList(),
      'videos': this.videos.map((e) => e.toMap()).toList(),
      'recommendations': this.recommendations.map((e) => e.toMap()).toList(),
      'similar': this.similar.map((e) => e.toMap()).toList(),
      'watchProviders': this.watchProviders.map((key, value) {
        return MapEntry(key, value.toMap());
      }),
    };
    _toMap.addAll(super.toMap());

    return _toMap;
  }
}
