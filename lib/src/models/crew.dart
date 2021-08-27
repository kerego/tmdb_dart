import '../helpers/gender-resolver.dart';
import '../settings/asset-resolver.dart';

import 'creator.dart';
import 'gender.dart';

class Crew extends Creator {
  final String? department;
  final String? job;

  Crew({
    String? creditId,
    required int id,
    Gender? gender,
    String? name,
    String? profilePath,
    this.department,
    this.job,
  }) : super(
          creditId: creditId,
          gender: gender,
          id: id,
          name: name,
          profilePath: profilePath,
        );

  factory Crew.fromJson(
    Map<String, dynamic> map,
    AssetResolver assetResolver,
  ) =>
      Crew(
        department: map["department"],
        creditId: map["credit_id"],
        gender: getGender(map["gender"]),
        id: map["id"],
        job: map["job"],
        name: map["name"],
        profilePath: assetResolver.getProfilePath(map["profile_path"]),
      );

  static List<Crew> listFromJson(
    List<dynamic> list,
    AssetResolver assetResolver,
  ) =>
      list.map((x) => Crew.fromJson(x, assetResolver)).toList(growable: false);
}
