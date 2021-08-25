import '../settings/asset-resolver.dart';

import 'alternative-title.dart';
import 'video.dart';
import 'collection.dart';
import 'company.dart';
import 'content-base.dart';
import 'country.dart';
import 'credits.dart';
import 'date.dart';
import 'external-info.dart';
import 'genre.dart';
import 'image-collection.dart';
import 'keyword.dart';

class Movie extends MovieBase {
  final Collection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final String? imdbId;
  final List<Company>? productionCompanies;
  final List<Country>? productionCountries;
  final int? revenue;
  final int? runtime;
  final List<Country>? spokenLanguages;
  final String? status;
  final String? tagline;

  // append_to_response
  final ImageCollection? images;
  final List<AlternativeTitle>? alternativeTitles;
  final Credits? credits;
  final ExternalInfo? externalIds;
  final List<Keyword>? keywords;
  final List<Video>? videos;
  final List<MovieBase>? recommendations;
  final List<MovieBase>? similar;

  Movie({
    required int id,
    String? originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    num? popularity,
    int? voteCount,
    num? voteAverage,
    bool? adult,
    Date? releaseDate,
    String? originalTitle,
    String? title,
    bool? video,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
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
          adult: adult,
          releaseDate: releaseDate,
          originalTitle: originalTitle,
          title: title,
          video: video,
        );

  // TODO
  // ReleaseDates
  // Translations
  // Reviews

  factory Movie.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      Movie(
        id: map["id"],
        originalLanguage: map["original_language"],
        backdropPath: assetResolver.getBackdropPath(map["backdrop_path"]),
        posterPath: assetResolver.getPosterPath(map["poster_path"]),
        overview: map["overview"],
        popularity: map["popularity"],
        voteCount: map["vote_count"],
        voteAverage: map["vote_average"],
        adult: map["adult"],
        releaseDate: Date.tryParse(map["release_date"]),
        originalTitle: map["original_title"],
        title: map["title"],
        video: map["video"],
        belongsToCollection: map["belongs_to_collection"] != null
            ? Collection.fromJson(map["belongs_to_collection"], assetResolver)
            : null,
        budget: map["budget"],
        genres: Genre.listFromJson(map["genres"]),
        homepage: map["homepage"],
        imdbId: map["imdb_id"],
        productionCompanies: Company.listFromJson(map["production_companies"], assetResolver),
        productionCountries: Country.listFromJson(map["production_countries"]),
        revenue: map["revenue"],
        runtime: map["runtime"],
        spokenLanguages: Country.listFromJson(map["spoken_languages"]),
        status: map["status"],
        tagline: map["tagline"],
        images: map.containsKey("images") ? ImageCollection.fromJson(map["images"], assetResolver) : null,
        alternativeTitles: map.containsKey("alternative_titles")
            ? AlternativeTitle.listFromJson(map["alternative_titles"]["titles"])
            : null,
        credits: map.containsKey("credits") ? Credits.fromJson(map["credits"], assetResolver) : null,
        externalIds: map.containsKey("external_ids") ? ExternalInfo.fromJson(map["external_ids"]) : null,
        keywords: map.containsKey("keywords") ? Keyword.listFromJson(map["keywords"]["keywords"]) : null,
        videos: map.containsKey("videos") ? Video.listFromJson(map["videos"]["results"]) : null,
        recommendations: map.containsKey("recommendations")
            ? MovieBase.listFromJson(map["recommendations"]["results"], assetResolver)
            : null,
        similar: map.containsKey("similar") ? MovieBase.listFromJson(map["similar"]["results"], assetResolver) : null,
      );
}
