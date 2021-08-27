part of 'tv-show.dart';

class TvEpisode extends EpisodeBase {
  final List<Crew> crew;
  final List<Cast> guestStars;

  TvEpisode({
    Date? airDate,
    int episodeNumber = 0,
    required int id,
    String name = '',
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
    this.airDate,
    this.episodeNumber = 0,
    required this.id,
    this.name = '',
    this.overview,
    this.productionCode,
    this.seasonNumber = 0,
    this.showId = 0,
    this.stillPath,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  factory EpisodeBase.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      EpisodeBase(
        airDate: Date.tryParse(map["air_date"]),
        episodeNumber: map["episode_number"] ?? 0,
        id: map["id"],
        name: map["name"],
        overview: map["overview"],
        productionCode: map["production_code"],
        seasonNumber: map["season_number"] ?? 0,
        showId: map["show_id"] ?? 0,
        stillPath: assetResolver.getStillPath(map["still_path"]),
        voteAverage: map["vote_average"] ?? 0,
        voteCount: map["vote_count"] ?? 0,
      );

  static List<EpisodeBase> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => EpisodeBase.fromJson(x, assetResolver))
          .toList(growable: false);
}
