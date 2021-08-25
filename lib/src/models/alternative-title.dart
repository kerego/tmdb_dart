class AlternativeTitle {
  late String iso3166_1;
  late String title;
  late String type;

  AlternativeTitle.fromJson(Map<String, dynamic> map) {
    iso3166_1 = map["iso_3166_1"];
    title = map["title"];
    type = map["type"];
  }

  static List<AlternativeTitle> listFromJson(List<dynamic> list) =>
      list.map((x) => AlternativeTitle.fromJson(x)).toList(growable: false);
}
