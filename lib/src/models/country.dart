class Country {
  /// [iso3166_1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code
  String? iso;
  String? englishName;
  String? nativeName;

  Country.fromJson(Map<String, dynamic> map) {
    iso = map["iso_3166_1"];
    englishName = map["english_name"];
    nativeName = map["native_name"];
  }

  static List<Country> listFromJson(List<dynamic> list) =>
      list.map((x) => Country.fromJson(x)).toList(growable: false);

  Map<String, dynamic> toMap() {
    return {
      'iso': this.iso,
      'english_name': this.englishName,
      'native_name': this.nativeName,
    };
  }
}
