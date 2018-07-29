class Configuration {
  String baseUrl;
  String secureBaseUrl;
  List<String> backdropSizes;
  List<String> logoSizes;
  List<String> posterSizes;
  List<String> profileSizes;
  List<String> stillSizes;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    Map<String, dynamic> imagesMap = new Map<String, dynamic>();

    imagesMap["base_url"] = baseUrl;
    imagesMap["secure_base_url"] = secureBaseUrl;
    imagesMap["backdrop_sizes"] = backdropSizes;
    imagesMap["logo_sizes"] = logoSizes;
    imagesMap["poster_sizes"] = posterSizes;
    imagesMap["profile_sizes"] = profileSizes;
    imagesMap["still_sizes"] = stillSizes;

    map["images"] = imagesMap;

    return map;
  }

  Configuration.fromJson(Map<String, dynamic> json) {
    json = json["images"];

    baseUrl = json["base_url"];
    secureBaseUrl = json["secure_base_url"];
    backdropSizes =
        new List<String>.from(json["backdrop_sizes"], growable: false);
    logoSizes = new List<String>.from(json["logo_sizes"], growable: false);
    posterSizes = new List<String>.from(json["poster_sizes"], growable: false);
    profileSizes =
        new List<String>.from(json["profile_sizes"], growable: false);
    stillSizes = new List<String>.from(json["still_sizes"], growable: false);
  }
}
