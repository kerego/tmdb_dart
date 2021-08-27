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
import 'watch-provider.dart';

class Movie extends MovieBase {
  final Collection? belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String? homepage;
  final String? imdbId;
  final List<Company> productionCompanies;
  final List<Country> productionCountries;
  final int revenue;
  final int runtime;
  final List<Country> spokenLanguages;
  final String? status;
  final String? tagline;

  // append_to_response
  final ImageCollection? images;
  final List<AlternativeTitle> alternativeTitles;
  final Credits? credits;
  final ExternalInfo? externalIds;
  final List<Keyword> keywords;
  final List<Video> videos;
  final List<MovieBase> recommendations;
  final List<MovieBase> similar;
  // The key represents a country code (more details there: https://developers.themoviedb.org/3/movies/get-movie-watch-providers)
  final Map<String, WatchProviders> watchProviders;

  Movie(
      {required int id,
      required String originalLanguage,
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
      List<int> genreIds = const [],
      bool video = false,
      this.belongsToCollection,
      int? budget,
      this.genres = const [],
      this.homepage,
      this.imdbId,
      this.productionCompanies = const [],
      this.productionCountries = const [],
      int? revenue,
      int? runtime,
      this.spokenLanguages = const [],
      this.status,
      this.tagline,
      this.images,
      this.alternativeTitles = const [],
      this.credits,
      this.externalIds,
      this.keywords = const [],
      this.videos = const [],
      this.recommendations = const [],
      this.similar = const [],
      this.watchProviders = const {}})
      : revenue = revenue ?? 0,
        runtime = runtime ?? 0,
        budget = budget ?? 0,
        super(
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
            genreIds: genreIds);

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
        adult: map["adult"] ?? false,
        releaseDate: Date.tryParse(map["release_date"]),
        originalTitle: map["original_title"],
        title: map["title"] ?? '',
        video: map["video"] ?? false,
        belongsToCollection: map["belongs_to_collection"] != null
            ? Collection.fromJson(map["belongs_to_collection"], assetResolver)
            : null,
        budget: map["budget"],
        genres: Genre.listFromJson(map["genres"] ?? []),
        genreIds:
            Genre.listFromJson(map["genres"] ?? []).map((e) => e.id).toList(),
        homepage: map["homepage"],
        imdbId: map["imdb_id"],
        productionCompanies:
            Company.listFromJson(map["production_companies"], assetResolver),
        productionCountries: Country.listFromJson(map["production_countries"]),
        revenue: map["revenue"],
        runtime: map["runtime"],
        spokenLanguages: Country.listFromJson(map["spoken_languages"] ?? []),
        status: map["status"],
        tagline: map["tagline"],
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
            ? MovieBase.listFromJson(
                map["recommendations"]["results"], assetResolver)
            : [],
        similar: map.containsKey("similar")
            ? MovieBase.listFromJson(map["similar"]["results"], assetResolver)
            : [],
        watchProviders: map.containsKey("watch/providers")
            ? WatchProviders.mapFromJson(map["watch/providers"]["results"])
            : {},
      );
}
