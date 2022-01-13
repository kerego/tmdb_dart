import 'package:tmdb_dart/src/settings/asset-resolver.dart';

class WatchProviders {
  WatchProviders({
    this.link,
    this.flatrate,
    this.rent,
    this.buy,
  });

  final String? link;
  final List<Provider>? flatrate;
  final List<Provider>? rent;
  final List<Provider>? buy;

  factory WatchProviders.fromJson(Map<String, dynamic> json) => WatchProviders(
        link: json["link"],
        flatrate: json["flatrate"] == null
            ? List.empty()
            : List<Provider>.from(
                json["flatrate"].map((x) => Provider.fromJson(x))),
        rent: json["rent"] == null
            ? List.empty()
            : List<Provider>.from(
                json["rent"].map((x) => Provider.fromJson(x))),
        buy: json["buy"] == null
            ? List.empty()
            : List<Provider>.from(json["buy"].map((x) => Provider.fromJson(x))),
      );

  static Map<String, WatchProviders> mapFromJson(Map<String, dynamic> map) =>
      map.map((country, watchProvidersJson) => MapEntry(country,
          WatchProviders.fromJson(watchProvidersJson as Map<String, dynamic>)));

  Map<String, dynamic> toMap() {
    return {
      'link': this.link,
      'flatrate': this.flatrate?.map((e) => e.toMap()).toList(),
      'rent': this.rent?.map((e) => e.toMap()).toList(),
      'buy': this.buy?.map((e) => e.toMap()).toList(),
    };
  }
}

class Provider {
  Provider({
    this.displayPriority,
    this.logoPath,
    this.providerId,
    this.providerName,
  });

  final int? displayPriority;
  final String? logoPath;
  final int? providerId;
  final String? providerName;

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        displayPriority: json["display_priority"],
        logoPath: json["logo_path"],
        providerId: json["provider_id"],
        providerName: json["provider_name"],
      );

  Map<String, dynamic> toMap() {
    return {
      'display_priority': this.displayPriority,
      'logo_path': AssetResolver.getPathFromUrl(this.logoPath),
      'provider_id': this.providerId,
      'provider_name': this.providerName,
    };
  }
}
