part of 'search-settings.dart';

class TvDiscoverSettings extends TvSearchSettings {
  /// Filter and only include TV shows that have a air date (by looking at all episodes) that is greater or equal to the specified value.
  final Date? airDateGTE;

  /// Filter and only include TV shows that have a air date (by looking at all episodes) that is less than or equal to the specified value.
  final Date? airDateLTE;

  /// Filter and only include TV shows that have a original air date that is greater or equal to the specified value. Can be used in conjunction with the "include_null_first_air_dates" filter if you want to include items with no air date.
  final Date? firstAirDateGTE;

  /// Filter and only include TV shows that have a original air date that is less than or equal to the specified value. Can be used in conjunction with the "include_null_first_air_dates" filter if you want to include items with no air date.
  final Date? firstAirDateLTE;

  /// Choose from one of the many available sort options.
  final SortBy? sortBy;

  /// Used in conjunction with the air_date.gte/lte filter to calculate the proper UTC offset.
  final String? timezone;

  /// Filter and only include movies that have a rating that is greater or equal to the specified value.
  final int? voteAverageGTE;

  /// Filter and only include movies that have a rating that is less than or equal to the specified value.
  final int? voteCountGTE;

  /// A comma separated list of production company ID's. Only include movies that have one of the ID's added as a production company.
  final List<int>? withCompanies;

  /// Comma separated value of genre ids that you want to exclude from the results.
  final List<int>? withGenres;

  /// Exclude items with certain keywords. You can comma and pipe seperate these values to create an 'AND' or 'OR' logic.
  final List<int>? withKeywords;

  /// Comma separated value of network ids that you want to include in the results.
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
        assert(voteAverageGTE == null ||
            voteAverageGTE >= 0 && voteAverageGTE <= 10),
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
