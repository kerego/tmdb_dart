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

  getBackdropPath(String contentUrl, [Resolution resolution = Resolution.Mid]) {
    return _getPathWithResolution(contentUrl, backdropSizes, resolution);
  }

  getLogoPath(String contentUrl, [Resolution resolution = Resolution.Mid]) {
    return _getPathWithResolution(contentUrl, logoSizes, resolution);
  }

  getPosterPath(String contentUrl, [Resolution resolution = Resolution.Mid]) {
    return _getPathWithResolution(contentUrl, posterSizes, resolution);
  }

  getProfilePath(String contentUrl, [Resolution resolution = Resolution.Mid]) {
    return _getPathWithResolution(contentUrl, profileSizes, resolution);
  }

  getStillPath(String contentUrl, [Resolution resolution = Resolution.Mid]) {
    return _getPathWithResolution(contentUrl, stillSizes, resolution);
  }

  _getPathWithResolution(
      String contentUrl, List<String> sizes, Resolution resolution) {
    switch (resolution) {
      case Resolution.Highest:
        return _getPathWithSize(contentUrl, sizes, sizes.length - 1);
      case Resolution.Lowest:
        return _getPathWithSize(contentUrl, sizes, 0);
      case Resolution.Mid:
        return _getPathWithSize(contentUrl, sizes, (sizes.length / 2).round());
    }
  }

  _getPathWithSize(String contentUrl, List<String> sizes, int size) {
    if (size < 0)
      size = 0;
    else if (size > sizes.length - 1) size = sizes.length - 1;

    var sizeUrl = sizes[size];
    return "$secureBaseUrl$sizeUrl$contentUrl";
  }
}

enum Resolution {
  Lowest,
  Mid,
  Highest,
}
