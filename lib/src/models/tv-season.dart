part of 'tv-show.dart';

class TvSeason extends SeasonBase {
  final List<TvEpisode> episodes;

  TvSeason({
    Date? airDate,
    int episodeCount = 0,
    required int id,
    String? name,
    String? overview,
    String? posterPath,
    int seasonNumber = 0,
    this.episodes = const [],
  }) : super(
          airDate: airDate,
          episodeCount: episodeCount,
          id: id,
          name: name,
          overview: overview,
          posterPath: posterPath,
          seasonNumber: seasonNumber,
        );

  factory TvSeason.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      TvSeason(
        airDate: Date.tryParse(map["air_date"]),
        episodeCount: map["episode_count"],
        id: map["id"],
        name: map["name"],
        overview: map["overview"],
        posterPath: assetResolver.getPosterPath(map["poster_path"]),
        seasonNumber: map["season_number"],
        episodes: TvEpisode.listFromJson(map["episodes"] ?? [], assetResolver),
      );

  Map<String, dynamic> toMap() {
    final _toMap = <String, dynamic>{
      'episodes': this.episodes.map((e) => e.toMap()).toList(),
    };
    _toMap.addAll(super.toMap());
    return _toMap;
  }
}

class SeasonBase {
  final Date? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String? overview;
  final String? posterPath;
  final int seasonNumber;

  SeasonBase({
    required this.id,
    int? episodeCount,
    String? name,
    int? seasonNumber,
    this.airDate,
    this.overview,
    this.posterPath,
  })  : name = name ?? '',
        episodeCount = episodeCount ?? 0,
        seasonNumber = seasonNumber ?? 0;

  factory SeasonBase.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      SeasonBase(
        airDate: Date.tryParse(map["air_date"]),
        episodeCount: map["episode_count"],
        id: map["id"],
        name: map["name"],
        overview: map["overview"],
        posterPath: assetResolver.getPosterPath(map["poster_path"]),
        seasonNumber: map["season_number"],
      );

  static List<SeasonBase> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => SeasonBase.fromJson(x, assetResolver))
          .toList(growable: false);

  Map<String, dynamic> toMap() {
    return {
      'air_date': this.airDate.toString(),
      'episode_count': this.episodeCount,
      'id': this.id,
      'name': this.name,
      'overview': this.overview,
      'poster_path': AssetResolver.getPathFromUrl(this.posterPath),
      'season_number': this.seasonNumber,
    };
  }
}
