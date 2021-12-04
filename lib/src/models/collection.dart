import '../settings/asset-resolver.dart';

class Collection {
  late int id;
  String? name;
  String? posterPath;
  String? backdropPath;

  Collection.fromJson(Map<String, dynamic> map, AssetResolver assetResolver) {
    id = map["id"];
    name = map["name"];
    posterPath = assetResolver.getPosterPath(map["poster_path"]);
    backdropPath = assetResolver.getBackdropPath(map["backdrop_path"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'poster_path': AssetResolver.getPathFromUrl(this.posterPath),
      'backdrop_path': AssetResolver.getPathFromUrl(this.backdropPath),
    };
  }
}
