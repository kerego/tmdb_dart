import '../helpers/gender-resolver.dart';
import '../settings/asset-resolver.dart';

import 'gender.dart';

class Creator {
  final int id;
  final Gender gender;
  final String name;
  final String? creditId;
  final String? profilePath;

  Creator({
    this.creditId,
    required this.id,
    Gender? gender,
    String? name,
    this.profilePath,
  })  : name = name ?? '',
        gender = gender ?? Gender.Other;

  factory Creator.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      Creator(
        creditId: map["credit_id"],
        id: map["id"],
        gender: getGender(map["gender"]),
        name: map["name"],
        profilePath: assetResolver.getProfilePath(map["profile_path"]),
      );

  static List<Creator> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list
          .map((x) => Creator.fromJson(x, assetResolver))
          .toList(growable: false);
}
