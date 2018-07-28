import 'package:tmdb_dart/tmdb.dart';

class MovieSearchSettings {
  String language;
  String query;
  int page;
  bool includeAdult;
  String region;
  int year;
  int primaryReleaseYear;
  Resolution posterResolution;
  Resolution backdropResolution;

  MovieSearchSettings(this.query,
      {this.language = "en-US",
      this.page = 1,
      this.includeAdult = false,
      this.posterResolution = Resolution.Mid,
      this.backdropResolution = Resolution.Mid,
      this.region,
      this.year,
      this.primaryReleaseYear}) {}

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["language"] = language;
    map["query"] = query;
    map["page"] = page.toString();
    map["include_adult"] = includeAdult.toString();
    map["region"] = region;
    map["year"] = year.toString();
    map["primary_release_year"] = primaryReleaseYear.toString();
    return map;
  }
}
