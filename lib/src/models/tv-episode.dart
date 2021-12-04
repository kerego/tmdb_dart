part of 'tv-show.dart';

class TvEpisode extends EpisodeBase {
  final List<Crew> crew;
  final List<Cast> guestStars;

  TvEpisode({
    Date? airDate,
    int episodeNumber = 0,
    required int id,
    String? name,
    String? overview,
    String? productionCode,
    int seasonNumber = 0,
    int showId = 0,
    String? stillPath,
    num voteAverage = 0,
    int voteCount = 0,
    this.crew = const [],
    this.guestStars = const [],
  }) : super(
          airDate: airDate,
          episodeNumber: episodeNumber,
          id: id,
          name: name,
          overview: overview,
          productionCode: productionCode,
          seasonNumber: seasonNumber,
          showId: showId,
          stillPath: stillPath,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory TvEpisode.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      TvEpisode(
        airDate: Date.tryParse(map["air_date"]),
        episodeNumber: map["episode_number"] ?? 0,
        id: map["id"],
        name: map["name"] ?? '',
        overview: map["overview"],
        productionCode: map["production_code"],
        seasonNumber: map["season_number"] ?? 0,
        showId: map["show_id"] ?? 0,
        stillPath: assetResolver.getStillPath(map["still_path"]),
        voteAverage: map["vote_average"] ?? 0,
        voteCount: map["vote_count"] ?? 0,
        crew: Crew.listFromJson(map["crew"] ?? [], assetResolver),
        guestStars: Cast.listFromJson(map["guest_stars"] ?? [], assetResolver),
      );

  static List<TvEpisode> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => TvEpisode.fromJson(x, assetResolver))
          .toList(growable: false);

  Map<String, dynamic> toMap() {
    final _toMap = <String, dynamic>{
      'crew': this.crew.map((e) => e.toMap()).toList(),
      'guest_stars': this.guestStars.map((e) => e.toMap()).toList(),
    };
    _toMap.addAll(super.toMap());

    return _toMap;
  }
}

class EpisodeBase {
  final Date? airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String? overview;
  final String? productionCode;
  final int seasonNumber;
  final int showId;
  final String? stillPath;
  final num voteAverage;
  final int voteCount;

  EpisodeBase({
    required this.id,
    String? name,
    int? episodeNumber,
    int? seasonNumber,
    int? showId,
    num? voteAverage,
    int? voteCount,
    this.airDate,
    this.overview,
    this.productionCode,
    this.stillPath,
  })  : name = name ?? '',
        episodeNumber = episodeNumber ?? 0,
        seasonNumber = seasonNumber ?? 0,
        showId = showId ?? 0,
        voteAverage = voteAverage ?? 0,
        voteCount = voteCount ?? 0;

  factory EpisodeBase.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      EpisodeBase(
        airDate: Date.tryParse(map["air_date"]),
        episodeNumber: map["episode_number"],
        id: map["id"],
        name: map["name"],
        overview: map["overview"],
        productionCode: map["production_code"],
        seasonNumber: map["season_number"],
        showId: map["show_id"] ?? 0,
        stillPath: assetResolver.getStillPath(map["still_path"]),
        voteAverage: map["vote_average"],
        voteCount: map["vote_count"],
      );

  static List<EpisodeBase> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => EpisodeBase.fromJson(x, assetResolver))
          .toList(growable: false);

  Map<String, dynamic> toMap() {
    return {
      'air_date': this.airDate,
      'episode_number': this.episodeNumber,
      'id': this.id,
      'name': this.name,
      'overview': this.overview,
      'production_code': this.productionCode,
      'season_number': this.seasonNumber,
      'show_id': this.showId,
      'still_path': this.stillPath,
      'vote_average': this.voteAverage,
      'vote_count': this.voteCount,
    };
  }
}
