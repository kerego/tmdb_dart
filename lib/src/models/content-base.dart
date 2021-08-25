import '../models/date.dart';
import '../settings/asset-resolver.dart';

class TvBase extends _CommonBase {
  final Date? firstAirDate;
  final String? name;
  final String? originalName;
  final List<String>? originCountry;

  TvBase({
    required int id,
    String? originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    List<int>? genreIds,
    num? popularity,
    int? voteCount,
    num? voteAverage,
    this.firstAirDate,
    this.name,
    this.originalName,
    this.originCountry,
  }) : super(
          id,
          originalLanguage,
          backdropPath,
          posterPath,
          overview,
          genreIds,
          popularity,
          voteCount,
          voteAverage,
        );

  factory TvBase.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      TvBase(
        id: map["id"],
        originalLanguage: map["original_language"],
        backdropPath: assetResolver.getBackdropPath(map["backdrop_path"]),
        posterPath: assetResolver.getPosterPath(map["poster_path"]),
        overview: map["overview"],
        genreIds: List.castFrom(map["genre_ids"]),
        popularity: map["popularity"],
        voteCount: map["vote_count"],
        voteAverage: map["vote_average"],
        firstAirDate: Date.tryParse(map["first_air_date"]),
        name: map["name"],
        originalName: map["original_name"],
        originCountry: List.castFrom(map["origin_country"]),
      );

  static List<TvBase> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list.map((x) => TvBase.fromJson(x, assetResolver)).toList(growable: false);
}

class MovieBase extends _CommonBase {
  final bool? adult;
  final Date? releaseDate;
  final String? originalTitle;
  final String? title;
  final bool? video;

  MovieBase({
    required int id,
    String? originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    List<int>? genreIds,
    num? popularity,
    int? voteCount,
    num? voteAverage,
    this.adult,
    this.releaseDate,
    this.originalTitle,
    this.title,
    this.video,
  }) : super(
          id,
          originalLanguage,
          backdropPath,
          posterPath,
          overview,
          genreIds,
          popularity,
          voteCount,
          voteAverage,
        );

  factory MovieBase.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      MovieBase(
        id: map["id"],
        originalLanguage: map["original_language"],
        backdropPath: assetResolver.getBackdropPath(map["backdrop_path"]),
        posterPath: assetResolver.getPosterPath(map["poster_path"]),
        overview: map["overview"],
        genreIds: List.castFrom(map["genre_ids"]),
        popularity: map["popularity"],
        voteCount: map["vote_count"],
        voteAverage: map["vote_average"],
        adult: map["adult"],
        releaseDate: Date.tryParse(map["release_date"]),
        originalTitle: map["original_title"],
        title: map["title"],
        video: map["video"],
      );

  static List<MovieBase> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list.map((x) => MovieBase.fromJson(x, assetResolver)).toList(growable: false);
}

abstract class _CommonBase {
  final int id;
  final String? originalLanguage;
  final String? backdropPath;
  final String? posterPath;
  final String? overview;
  final List<int>? genreIds;
  final num? popularity;
  final int? voteCount;
  final num? voteAverage;

  const _CommonBase(
    this.id,
    this.originalLanguage,
    this.backdropPath,
    this.posterPath,
    this.overview,
    this.genreIds,
    this.popularity,
    this.voteCount,
    this.voteAverage,
  );
}
