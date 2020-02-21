import '../settings/asset-resolver.dart';

class Company {
  int id;
  String logoPath;
  String name;
  String originalCountry;

  Company.fromJson(Map<String, dynamic> map, AssetResolver assetResolver) {
    id = map["id"];
    name = map["name"];
    logoPath = assetResolver.getLogoPath(map["logo_path"]);
    originalCountry = map["original_country"];
  }

  static List<Company> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => Company.fromJson(x, assetResolver))
          .toList(growable: false);
}
