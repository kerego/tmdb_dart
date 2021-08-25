import '../settings/asset-resolver.dart';

import 'cast.dart';
import 'crew.dart';

class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits.fromJson(Map<String, dynamic> map, AssetResolver assetResolver) {
    cast = Cast.listFromJson(map["cast"], assetResolver);
    crew = Crew.listFromJson(map["crew"], assetResolver);
  }
}
