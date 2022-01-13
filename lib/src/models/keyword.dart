class Keyword {
  final int id;
  final String name;

  Keyword.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"] ?? '';

  static List<Keyword> listFromJson(List<dynamic> list) =>
      list.map((x) => Keyword.fromJson(x)).toList(growable: false);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }
}
