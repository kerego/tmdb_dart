import 'package:tmdb_dart/tmdb.dart';

class MovieBase {
  String posterPath;
  bool adult;
  String overview;
  DateTime releaseDate;
  List<int> genreIds;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  num popularity;
  int voteCount;
  bool video;
  num voteAverage;

  MovieBase() {}

  MovieBase.fromJson(Map<String, dynamic> json, Configuration configuration,
      MovieSearchSettings settings) {
    posterPath = configuration.getPosterPath(
        json["poster_path"], settings.posterResolution);
    adult = json["adult"];
    overview = json["overview"];
    releaseDate = DateTime.parse(json["release_date"]);
    genreIds = List.castFrom(["genre_ids"]);
    originalTitle = json["original_title"];
    originalLanguage = json["original_language"];
    title = json["title"];
    backdropPath = configuration.getBackdropPath(
        json["backdrop_path"], settings.backdropResolution);
    popularity = json["popularity"];
    voteCount = json["vote_count"];
    video = json["video"];
    voteAverage = json["vote_average"];
  }
}
