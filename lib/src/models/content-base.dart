import '../models/date.dart';
import '../settings/asset-resolver.dart';

class TvBase extends _CommonBase {
  final Date? firstAirDate;
  final String name;
  final String? originalName;
  final List<String> originCountry;

  TvBase({
    required int id,
    required String originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    List<int> genreIds = const [],
    num? popularity,
    int? voteCount,
    num? voteAverage,
    this.firstAirDate,
    String? name,
    this.originalName,
    this.originCountry = const [],
  })  : name = name ?? '',
        super(
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
        genreIds: List.castFrom(map["genre_ids"] ?? []),
        popularity: map["popularity"],
        voteCount: map["vote_count"],
        voteAverage: map["vote_average"],
        firstAirDate: Date.tryParse(map["first_air_date"]),
        name: map["name"],
        originalName: map["original_name"],
        originCountry: List.castFrom(map["origin_country"] ?? []),
      );

  static List<TvBase> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => TvBase.fromJson(x, assetResolver))
          .toList(growable: false);

  Map<String, dynamic> toMap() {
    final _toMap = {
      'first_air_date': this.firstAirDate,
      'name': this.name,
      'original_name': this.originalName,
      'origin_country': this.originCountry,
    };
    _toMap.addAll(super.toMap());
    return _toMap;
  }
}

class MovieBase extends _CommonBase {
  final bool adult;
  final Date? releaseDate;
  final String? originalTitle;
  final String title;
  final bool video;

  MovieBase({
    required int id,
    required String originalLanguage,
    String? backdropPath,
    String? posterPath,
    String? overview,
    List<int> genreIds = const [],
    num? popularity,
    int? voteCount,
    num? voteAverage,
    bool? adult,
    this.releaseDate,
    this.originalTitle,
    String? title,
    this.video = false,
  })  : title = title ?? '',
        adult = adult ?? false,
        super(
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
        genreIds: List.castFrom(map["genre_ids"] ?? []),
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
      list
          .map((x) => MovieBase.fromJson(x, assetResolver))
          .toList(growable: false);

  Map<String, dynamic> toMap() {
    final _toMap = {
      'adult': this.adult,
      'release_date': this.releaseDate.toString(),
      'original_title': this.originalTitle,
      'title': this.title,
      'video': this.video,
    };
    _toMap.addAll(super.toMap());
    return _toMap;
  }
}

abstract class _CommonBase {
  final int id;
  final String originalLanguage;
  final String? backdropPath;
  final String? posterPath;
  final String? overview;
  final List<int> genreIds;
  final num popularity;
  final int voteCount;
  final num voteAverage;

  const _CommonBase(
    this.id,
    this.originalLanguage,
    this.backdropPath,
    this.posterPath,
    this.overview,
    this.genreIds,
    num? popularity,
    int? voteCount,
    num? voteAverage,
  )   : voteCount = voteCount ?? 0,
        voteAverage = voteAverage ?? 0,
        popularity = popularity ?? 0;

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'original_language': this.originalLanguage,
      'backdrop_path': this.backdropPath,
      'poster_path': this.posterPath,
      'overview': this.overview,
      'genre_ids': this.genreIds,
      'popularity': this.popularity,
      'vote_count': this.voteCount,
      'vote_average': this.voteAverage,
    };
  }
}
