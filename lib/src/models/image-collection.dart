import 'package:tmdb_dart/tmdb_dart.dart';

class ImageCollection {
  List<Image> backdrops;
  List<Image> posters;

  ImageCollection.fromJson(
      Map<String, dynamic> map, AssetResolver assetResolver) {
    posters = Image.listFromJson(map["posters"], assetResolver.getPosterPath);
    backdrops =
        Image.listFromJson(map["backdrops"], assetResolver.getBackdropPath);
  }
}
