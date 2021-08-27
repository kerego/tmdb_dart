class ImageInfo {
  late final num aspectRatio;
  late final String? filePath;
  late final int height;

  /// [iso_639_1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) code
  late final String? iso;
  late final num voteAverage;
  late final int voteCount;
  late final int width;

  ImageInfo.fromJson(
      Map<String, dynamic> map, String? resolveAsset(String? path)) {
    aspectRatio = map["aspect_ratio"] ?? 0;
    filePath = resolveAsset(map["file_path"]);
    height = map["height"] ?? 0;
    iso = map["iso_639_1"];
    voteAverage = map["vote_average"] ?? 0;
    voteCount = map["vote_count"] ?? 0;
    width = map["width"] ?? 0;
  }

  static List<ImageInfo> listFromJson(
          List<dynamic> list, String? resolveAsset(String? path)) =>
      list
          .map((x) => ImageInfo.fromJson(x, resolveAsset))
          .toList(growable: false);
}
