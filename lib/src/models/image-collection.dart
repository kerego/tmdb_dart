import '../settings/asset-resolver.dart';
import 'image-info.dart';

class ImageCollection {
  final List<ImageInfo> backdrops;
  final List<ImageInfo> posters;

  ImageCollection.fromJson(
      Map<String, dynamic> map, AssetResolver assetResolver)
      : posters = ImageInfo.listFromJson(
            map["posters"] ?? [], assetResolver.getPosterPath),
        backdrops = ImageInfo.listFromJson(
            map["backdrops"] ?? [], assetResolver.getBackdropPath);

  Map<String, dynamic> toMap() {
    return {
      'backdrops': this.backdrops.map((e) => e.toMap()).toList(),
      'posters': this.posters.map((e) => e.toMap()).toList(),
    };
  }

}
