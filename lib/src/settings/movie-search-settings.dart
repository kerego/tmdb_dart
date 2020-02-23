import '../models/date.dart';
import '../models/sort-by.dart';

import 'quality-settings.dart';

part 'movie-discover-settings.dart';

class MovieSearchSettings {
  final String language;
  final String query;
  final int page;
  final bool includeAdult;
  final String region;
  final int year;
  final int primaryReleaseYear;
  final QualitySettings quality;

  const MovieSearchSettings({
    this.query,
    this.language = "en-US",
    this.page = 1,
    this.includeAdult = false,
    this.region,
    this.year,
    this.primaryReleaseYear,
    this.quality = const QualitySettings(),
  }) : assert(quality != null);

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map["language"] = language;
    map["query"] = query;
    map["page"] = page?.toString();
    map["include_adult"] = includeAdult?.toString();
    map["region"] = region;
    map["year"] = year?.toString();
    map["primary_release_year"] = primaryReleaseYear?.toString();

    map.removeWhere((_, value) => value == null);

    return map;
  }
}
