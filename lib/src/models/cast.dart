import '../helpers/gender-resolver.dart';
import '../settings/asset-resolver.dart';

import 'gender.dart';

class Cast {
  int castId;
  String character;
  String creditId;
  int id;
  Gender gender;
  String name;
  int order;
  String profilePath;

  Cast.fromJson(Map<String, dynamic> map, AssetResolver assetResolver) {
    castId = map["cast_id"];
    character = map["character"];
    creditId = map["credit_id"];
    id = map["id"];
    gender = getGender(map["gender"]);
    name = map["name"];
    order = map["order"];
    profilePath = assetResolver.getProfilePath(map["profile_path"]);
  }

  static List<Cast> listFromJson(
          List<dynamic> list, AssetResolver assetResolver) =>
      list
          .map((x) => new Cast.fromJson(x, assetResolver))
          .toList(growable: false);
}
