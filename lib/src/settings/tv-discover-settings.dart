part of 'search-settings.dart';

class TvDiscoverSettings extends TvSearchSettings {
  final Date? airDateGTE;
  final Date? airDateLTE;
  final Date? firstAirDateGTE;
  final Date? firstAirDateLTE;
  final SortBy? sortBy;
  final String? timezone;
  final int? voteAverageGTE;
  final int? voteCountGTE;
  final List<int>? withCompanies;
  final List<int>? withGenres;
  final List<int>? withKeywords;
  final List<int>? withNetworks;

  const TvDiscoverSettings({
    this.airDateGTE,
    this.airDateLTE,
    this.firstAirDateGTE,
    this.firstAirDateLTE,
    int? firstAirDateYear,
    bool? includeAdult,
    String? language,
    this.sortBy,
    this.timezone,
    this.voteCountGTE,
    this.voteAverageGTE,
    this.withCompanies,
    this.withGenres,
    this.withKeywords,
    this.withNetworks,
    QualitySettings quality = const QualitySettings(),
  })  : assert(voteCountGTE == null || voteCountGTE >= 0),
        assert(voteAverageGTE == null || voteAverageGTE >= 0 && voteAverageGTE <= 10),
        super(
          language: language,
          includeAdult: includeAdult,
          firstAirDateYear: firstAirDateYear,
          quality: quality,
        );

  Map<String, dynamic> toJson() {
    var map = super.toJson();

    map['air_date.gte'] = airDateGTE?.toString();
    map['air_date.lte'] = airDateLTE?.toString();
    map['first_air_date.gte'] = firstAirDateGTE?.toString();
    map['first_air_date.lte'] = firstAirDateLTE?.toString();
    map['sort_by'] = sortBy?.toString();
    map['timezone'] = timezone;
    map['vote_count.gte'] = voteCountGTE?.toString();
    map['vote_average.gte'] = voteAverageGTE?.clamp(0, 10).toString();
    map['with_companies'] = withCompanies?.join(',');
    map['with_genres'] = withGenres?.join(',');
    map['with_keywords'] = withKeywords?.join(',');
    map['with_networks'] = withNetworks?.join(',');

    map.removeWhere((_, value) => value == null);

    return map;
  }
}
