import '../models/date.dart';
import '../models/sort-by.dart';

import 'quality-settings.dart';

part 'movie-discover-settings.dart';
part 'tv-discover-settings.dart';

/// Movie search settings
class MovieSearchSettings extends SearchSettings<MovieSearchSettings> {
  const MovieSearchSettings({
    String? query,
    String? language,
    bool? includeAdult,
    String? region,
    int? year,
    int? primaryReleaseYear,
    QualitySettings? quality,
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

/// Movie search settings
class TvSearchSettings extends SearchSettings<TvSearchSettings> {
  const TvSearchSettings({
    String? query,
    String? language,
    bool? includeAdult,
    int? firstAirDateYear,
    QualitySettings? quality,
  }) : super._create(
          query: query,
          language: language,
          includeAdult: includeAdult,
          firstAirDateYear: firstAirDateYear,
          quality: quality ?? const QualitySettings(),
        );
}

/// Search settings
abstract class SearchSettings<T> {
  /// Specify a language to query translatable fields with.
  final String? language;

  /// Search query
  final String? query;

  /// A filter and include or exclude adult movies.
  final bool? includeAdult;

  /// Use the ISO-3166-1 code to filter the providers that are available in a particular country.
  final String? region;

  /// A filter to limit the results to a specific year (looking at all release dates).
  final int? year;

  /// A filter to limit the results to a specific primary release year.
  final int? primaryReleaseYear;

  /// Filter and only include TV shows that have a original air date year that equal to the specified value. Can be used in conjunction with the "include_null_first_air_dates" filter if you want to include items with no air date.
  final int? firstAirDateYear;

  /// Quality settings
  final QualitySettings? quality;

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
    String? query,
    String? language,
    bool? includeAdult,
    String? region,
    QualitySettings? quality,
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
