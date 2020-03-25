part of 'search-settings.dart';

class MovieDiscoverSettings extends MovieSearchSettings {
  final String certificationCountry;
  final String certification;
  final String certificationLTE;
  final bool includeVideo;
  final Date primaryReleaseDateGTE;
  final Date primaryReleaseDateLTE;
  final Date releaseDateGTE;
  final Date releaseDateLTE;
  final SortBy sortBy;
  final int voteCountGTE;
  final int voteCountLTE;
  final num voteAverageGTE;
  final num voteAverageLTE;
  final int withCast;
  final int withCrew;
  final List<int> withCompanies;
  final List<int> withGenres;
  final List<int> withKeywords;
  final List<int> withPeople;

  const MovieDiscoverSettings({
    this.certificationCountry,
    this.certification,
    this.certificationLTE,
    bool includeAdult = false,
    this.includeVideo = false,
    String language = "en-US",
    int year,
    int primaryReleaseYear,
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
            voteAverageLTE >= 0 && voteAverageGTE <= 10),
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
    map['vote_average.gte'] = voteAverageGTE?.clamp(0, 10)?.toString();
    map['vote_average.lte'] = voteAverageLTE?.clamp(0, 10)?.toString();
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
