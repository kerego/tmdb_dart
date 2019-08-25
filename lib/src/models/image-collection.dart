import 'image-info.dart';
import '../settings/asset-resolver.dart';

class ImageCollection {
  List<ImageInfo> backdrops;
  List<ImageInfo> posters;

  ImageCollection.fromJson(
      Map<String, dynamic> map, AssetResolver assetResolver) {
    posters =
        ImageInfo.listFromJson(map["posters"], assetResolver.getPosterPath);
    backdrops =
        ImageInfo.listFromJson(map["backdrops"], assetResolver.getBackdropPath);
  }
}
