import '../settings/asset-resolver.dart';

class Company {
  final int id;
  final String? logoPath;
  final String? name;
  final String? originalCountry;

  Company({required this.id, this.logoPath, this.name, this.originalCountry});

  factory Company.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      Company(
        id: map["id"],
        logoPath: assetResolver.getLogoPath(map["logo_path"]),
        name: map["name"],
        originalCountry: map["original_country"],
      );

  static List<Company> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => Company.fromJson(x, assetResolver))
          .toList(growable: false);
}
