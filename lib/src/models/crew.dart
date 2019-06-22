import '../helpers/gender-resolver.dart';
import '../settings/asset-resolver.dart';

import 'gender.dart';

class Crew {
  String creditId;
  String department;
  Gender gender;
  int id;
  String job;
  String name;
  String profilePath;

  Crew.fromJson(Map<String, dynamic> map, AssetResolver assetResolver) {
    department = map["department"];
    creditId = map["credit_id"];
    gender = getGender(map["gender"]);
    id = map["id"];
    job = map["job"];
    name = map["name"];
    profilePath = assetResolver.getProfilePath(map["profile_path"]);
  }

  static List<Crew> listFromJson(
          List<dynamic> list, AssetResolver assetResolver) =>
      list
          .map((x) => new Crew.fromJson(x, assetResolver))
          .toList(growable: false);
}
