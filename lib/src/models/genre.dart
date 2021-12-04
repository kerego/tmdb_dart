class Genre {
  final int id;
  final String name;

  Genre.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"] ?? '';

  static List<Genre> listFromJson(List<dynamic> list) =>
      list.map((x) => Genre.fromJson(x)).toList(growable: false);

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }
}
