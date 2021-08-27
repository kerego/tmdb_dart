import '../helpers/gender-resolver.dart';
import '../settings/asset-resolver.dart';

import 'creator.dart';
import 'gender.dart';

class Cast extends Creator {
  final int? castId;
  final String? character;
  final int? order;

  Cast({
    String? creditId,
    required int id,
    Gender? gender,
    String name = '',
    String? profilePath,
    this.castId,
    this.character,
    this.order,
  }) : super(
          creditId: creditId,
          gender: gender,
          id: id,
          name: name,
          profilePath: profilePath,
        );

  factory Cast.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      Cast(
        castId: map["cast_id"],
        character: map["character"],
        creditId: map["credit_id"],
        id: map["id"],
        gender: getGender(map["gender"]),
        name: map["name"] ?? '',
        order: map["order"],
        profilePath: assetResolver.getProfilePath(map["profile_path"]),
      );

  static List<Cast> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list.map((x) => Cast.fromJson(x, assetResolver)).toList(growable: false);
}
