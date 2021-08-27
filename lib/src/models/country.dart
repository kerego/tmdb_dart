class Country {
  /// [iso3166_1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code
  String? iso;
  String? name;

  Country.fromJson(Map<String, dynamic> map) {
    iso = map["iso_3166_1"];
    name = map["name"];
  }

  static List<Country> listFromJson(List<dynamic> list) =>
      list.map((x) => Country.fromJson(x)).toList(growable: false);
}
