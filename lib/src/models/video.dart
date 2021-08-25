class Video {
  final String id;
  final String? iso_639_1;
  final String? iso_3166_1;
  final String? key;
  final String? name;
  final String? site;
  final int? size;
  final String? type;

  Video({
    required this.id,
    this.iso_639_1,
    this.iso_3166_1,
    this.key,
    this.name,
    this.site,
    this.size,
    this.type,
  });

  factory Video.fromJson(Map<String, dynamic> map) => Video(
        id: map["id"],
        iso_639_1: map["iso_639_1"],
        iso_3166_1: map["iso_3166_1"],
        key: map["key"],
        name: map["name"],
        site: map["site"],
        size: map["size"],
        type: map["type"],
      );

  static List<Video> listFromJson(List<dynamic> list) => list.map((x) => Video.fromJson(x)).toList(growable: false);
}
