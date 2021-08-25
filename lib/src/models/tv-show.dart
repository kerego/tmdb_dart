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
  final List<Creator>? createdBy;
  final List<int>? episodeRunTime;
  final List<Genre>? genres;
  final String? homepage;
  final bool? inProduction;
  final List<String>? languages;
  final Date? lastAirDate;
  final dynamic lastEpisodeToAir;
  final List<Company>? networks;
  final int? numOfEpisodes;
  final int? numOfSeasons;
  final List<Company>? productionCompanies;
  final List<SeasonBase>? seasons;
  final String? status, type;

  // append_to_response
  final ImageCollection? images;
  final List<AlternativeTitle>? alternativeTitles;
  final Credits? credits;
  final ExternalInfo? externalIds;
  final List<Keyword>? keywords;
  final List<Video>? videos;
  final List<TvBase>? recommendations;
  final List<TvBase>? similar;

  TvShow({
    required int id,
    String? originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    num? popularity,
    int? voteCount,
    num? voteAverage,
    Date? firstAirDate,
    String? name,
    String? originalName,
    List<String>? originCountry,
    this.createdBy,
    this.episodeRunTime,
    this.genres,
    this.homepage,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.networks,
    this.numOfEpisodes,
    this.numOfSeasons,
    this.productionCompanies,
    this.seasons,
    this.status,
    this.type,
    this.images,
    this.alternativeTitles,
    this.credits,
    this.externalIds,
    this.keywords,
    this.videos,
    this.recommendations,
    this.similar,
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
        );

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
        originCountry: List.castFrom(map["origin_country"]),
        createdBy: Creator.listFromJson(map["created_by"], assetResolver),
        episodeRunTime: List.castFrom(map["episode_run_time"]),
        genres: Genre.listFromJson(map["genres"]),
        homepage: map["homepage"],
        inProduction: map["in_production"],
        languages: List.castFrom(map["languages"]),
        lastAirDate: Date.tryParse(map["last_air_date"]),
        lastEpisodeToAir:
            map["last_episode_to_air"] != null ? EpisodeBase.fromJson(map["last_episode_to_air"], assetResolver) : null,
        networks: Company.listFromJson(map["networks"], assetResolver),
        numOfEpisodes: map["number_of_episodes"],
        numOfSeasons: map["number_of_seasons"],
        productionCompanies: Company.listFromJson(map["production_companies"], assetResolver),
        seasons: SeasonBase.listFromJson(map["seasons"], assetResolver),
        status: map["status"],
        type: map["type"],
        images: map.containsKey("images") ? ImageCollection.fromJson(map["images"], assetResolver) : null,
        alternativeTitles: map.containsKey("alternative_titles")
            ? AlternativeTitle.listFromJson(map["alternative_titles"]["titles"])
            : null,
        credits: map.containsKey("credits") ? Credits.fromJson(map["credits"], assetResolver) : null,
        externalIds: map.containsKey("external_ids") ? ExternalInfo.fromJson(map["external_ids"]) : null,
        keywords: map.containsKey("keywords") ? Keyword.listFromJson(map["keywords"]["keywords"]) : null,
        videos: map.containsKey("videos") ? Video.listFromJson(map["videos"]["results"]) : null,
        recommendations: map.containsKey("recommendations")
            ? TvBase.listFromJson(map["recommendations"]["results"], assetResolver)
            : null,
        similar: map.containsKey("similar") ? TvBase.listFromJson(map["similar"]["results"], assetResolver) : null,
      );
}
