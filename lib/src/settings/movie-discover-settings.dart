part of 'search-settings.dart';

/// Movie discover settings
class MovieDiscoverSettings extends MovieSearchSettings {
  ///Used in conjunction with the certification filter, use this to specify a country with a valid certification.
  final String? certificationCountry;

  /// Filter results with a valid certification from the 'certification_country' field.
  final String? certification;

  /// Filter and only include movies that have a certification that is less than or equal to the specified value.
  final String? certificationLTE;

  /// A filter to include or exclude videos.
  final bool? includeVideo;

  /// Filter and only include movies that have a primary release date that is greater or equal to the specified value.
  final Date? primaryReleaseDateGTE;

  /// Filter and only include movies that have a primary release date that is less than or equal to the specified value.
  final Date? primaryReleaseDateLTE;

  /// Filter and only include movies that have a release date (looking at all release dates) that is greater or equal to the specified value.
  final Date? releaseDateGTE;

  /// Filter and only include movies that have a release date (looking at all release dates) that is less than or equal to the specified value.
  final Date? releaseDateLTE;

  /// Choose from one of the many available sort options.
  final SortBy? sortBy;

  /// Filter and only include movies that have a vote count that is greater or equal to the specified value.
  final int? voteCountGTE;

  /// Filter and only include movies that have a vote count that is less than or equal to the specified value.
  final int? voteCountLTE;

  /// Filter and only include movies that have a rating that is greater or equal to the specified value.
  final num? voteAverageGTE;

  /// Filter and only include movies that have a rating that is less than or equal to the specified value.
  final num? voteAverageLTE;

  /// A comma separated list of person ID's. Only include movies that have one of the ID's added as an actor.
  final int? withCast;

  /// A comma separated list of person ID's. Only include movies that have one of the ID's added as a crew member.
  final int? withCrew;

  /// A comma separated list of production company ID's. Only include movies that have one of the ID's added as a production company.
  final List<int>? withCompanies;

  /// Comma separated value of genre ids that you want to include in the results.
  final List<int>? withGenres;

  /// Exclude items with certain keywords. You can comma and pipe seperate these values to create an 'AND' or 'OR' logic.
  final List<int>? withKeywords;

  /// A comma separated list of person ID's. Only include movies that have one of the ID's added as a either a actor or a crew member.
  final List<int>? withPeople;

  const MovieDiscoverSettings({
    this.certificationCountry,
    this.certification,
    this.certificationLTE,
    bool? includeAdult,
    this.includeVideo,
    String? language,
    int? year,
    int? primaryReleaseYear,
    this.primaryReleaseDateGTE,
    this.primaryReleaseDateLTE,
    this.releaseDateGTE,
    this.releaseDateLTE,
    this.sortBy,
    this.voteCountGTE,
    this.voteCountLTE,
    this.voteAverageGTE,
    this.voteAverageLTE,
    this.withCast,
    this.withCrew,
    this.withCompanies,
    this.withGenres,
    this.withKeywords,
    this.withPeople,
    QualitySettings quality = const QualitySettings(),
  })  : assert(voteCountGTE == null || voteCountGTE >= 0),
        assert(voteCountLTE == null || voteCountLTE >= 1),
        assert(voteAverageGTE == null ||
            voteAverageGTE >= 0 && voteAverageGTE <= 10),
        assert(voteAverageLTE == null ||
            voteAverageLTE >= 0 &&
                (voteAverageGTE != null && voteAverageGTE <= 10)),
        super(
          language: language,
          includeAdult: includeAdult,
          year: year,
          primaryReleaseYear: primaryReleaseYear,
          quality: quality,
        );

  Map<String, dynamic> toJson() {
    var map = super.toJson();

    map['certification_country'] = certificationCountry;
    map['certification'] = certification;
    map['certification.lte'] = certificationLTE;
    map['include_video'] = includeVideo?.toString();
    map['primary_release_date.gte'] = primaryReleaseDateGTE?.toString();
    map['primary_release_date.lte'] = primaryReleaseDateLTE?.toString();
    map['release_date.gte'] = releaseDateGTE?.toString();
    map['release_date.lte'] = releaseDateLTE?.toString();
    map['sort_by'] = sortBy?.toString();
    map['vote_count.gte'] = voteCountGTE?.toString();
    map['vote_count.lte'] = voteCountLTE?.toString();
    map['vote_average.gte'] = voteAverageGTE?.clamp(0, 10).toString();
    map['vote_average.lte'] = voteAverageLTE?.clamp(0, 10).toString();
    map['with_cast'] = withCast?.toString();
    map['with_crew'] = withCrew?.toString();
    map['with_companies'] = withCompanies?.join(',');
    map['with_genres'] = withGenres?.join(',');
    map['with_keywords'] = withKeywords?.join(',');
    map['with_people'] = withPeople?.join(',');

    map.removeWhere((_, value) => value == null);

    return map;
  }
}
