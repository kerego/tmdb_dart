class Video {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  String site;
  String type;

  Video.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    iso_639_1 = map["iso_639_1"];
    iso_3166_1 = map["iso_3166_1"];
    key = map["key"];
    name = map["name"];
    site = map["site"];
    type = map["type"];
  }

  static List<Video> listFromJson(List<dynamic> list) =>
      list.map((x) => Video.fromJson(x)).toList(growable: false);
}
