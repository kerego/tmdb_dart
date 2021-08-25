class ImageInfo {
  num? aspectRatio;
  String? filePath;
  int? height;
  String? iso;
  num? voteAverage;
  int? voteCount;
  int? width;

  ImageInfo.fromJson(Map<String, dynamic> map, String? resolveAsset(String? path)) {
    aspectRatio = map["aspect_ratio"];
    filePath = resolveAsset(map["file_path"]);
    height = map["height"];
    iso = map["iso_639_1"];
    voteAverage = map["vote_average"];
    voteCount = map["vote_count"];
    width = map["width"];
  }

  static List<ImageInfo> listFromJson(List<dynamic> list, String? resolveAsset(String? path)) =>
      list.map((x) => ImageInfo.fromJson(x, resolveAsset)).toList(growable: false);
}
