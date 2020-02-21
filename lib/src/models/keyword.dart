class Keyword {
  int id;
  String name;

  Keyword.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
  }

  static List<Keyword> listFromJson(List<dynamic> list) =>
      list.map((x) => Keyword.fromJson(x)).toList(growable: false);
}
