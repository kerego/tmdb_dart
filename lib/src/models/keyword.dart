class Keyword {
  late final int id;
  late final String name;

  Keyword.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"] ?? 0;
  }

  static List<Keyword> listFromJson(List<dynamic> list) =>
      list.map((x) => Keyword.fromJson(x)).toList(growable: false);
}
