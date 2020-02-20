import 'quality-settings.dart';

class MovieSearchSettings {
  String language;
  String query;
  int page;
  bool includeAdult;
  String region;
  int year;
  int primaryReleaseYear;
  QualitySettings quality;

  MovieSearchSettings(
      {this.query,
      this.language = "en-US",
      this.page = 1,
      this.includeAdult = false,
      this.region,
      this.year,
      this.primaryReleaseYear,
      QualitySettings quality}) {
    this.quality = quality ?? QualitySettings();
  }

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
