import 'package:tmdb_dart/tmdb_dart.dart';

class Collection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  Collection.fromJson(Map<String, dynamic> map, AssetResolver assetResolver) {
    id = map["id"];
    name = map["name"];
    posterPath = assetResolver.getPosterPath(map["poster_path"]);
    backdropPath = assetResolver.getBackdropPath(map["backdrop_path"]);
  }
}
