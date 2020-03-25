import '../models/date.dart';
import '../models/sort-by.dart';

import 'quality-settings.dart';

part 'movie-discover-settings.dart';
part 'tv-discover-settings.dart';

class MovieSearchSettings extends SearchSettings<MovieSearchSettings> {
  const MovieSearchSettings({
    String query,
    String language,
    bool includeAdult,
    String region,
    int year,
    int primaryReleaseYear,
    QualitySettings quality,
  }) : super._create(
          query: query,
          language: language,
          includeAdult: includeAdult,
          region: region,
          year: year,
          primaryReleaseYear: primaryReleaseYear,
          quality: quality ?? const QualitySettings(),
        );
}

class TvSearchSettings extends SearchSettings<TvSearchSettings> {
  const TvSearchSettings({
    String query,
    String language,
    bool includeAdult,
    int firstAirDateYear,
    QualitySettings quality,
  }) : super._create(
          query: query,
          language: language,
          includeAdult: includeAdult,
          firstAirDateYear: firstAirDateYear,
          quality: quality ?? const QualitySettings(),
        );
}

abstract class SearchSettings<T> {
  final String language;
  final String query;
  final bool includeAdult;
  final String region;
  final int year;
  final int primaryReleaseYear;
  final int firstAirDateYear;
  final QualitySettings quality;

  const SearchSettings._create({
    this.query,
    this.language,
    this.includeAdult,
    this.region,
    this.year,
    this.primaryReleaseYear,
    this.firstAirDateYear,
    this.quality,
  }) : assert(quality != null);

  static SearchSettings multi({
    String query,
    String language,
    bool includeAdult,
    String region,
    QualitySettings quality,
  }) =>
      MovieSearchSettings(
        query: query,
        language: language,
        includeAdult: includeAdult,
        region: region,
        quality: quality ?? const QualitySettings(),
      );

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map["language"] = language;
    map["query"] = query;
    map["include_adult"] = includeAdult?.toString();
    map["region"] = region;
    map["year"] = year?.toString();
    map["primary_release_year"] = primaryReleaseYear?.toString();
    map["first_air_date_year"] = firstAirDateYear?.toString();

    map.removeWhere((_, value) => value == null);

    return map;
  }
}
