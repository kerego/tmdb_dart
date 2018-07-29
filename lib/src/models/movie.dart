import 'package:tmdb_dart/tmdb_dart.dart';

class Movie extends MovieBase {
  Collection belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  String imdbId;
  List<Company> productionCompanies;
  List<Country> productionCountries;
  int revenue;
  int runtime;
  List<Country> spokenLanguages;
  String status;
  String tagline;

  // append_to_response
  ImageCollection images;

  Movie.fromJson(Map<String, dynamic> map, AssetResolver assetResolver)
      : super.fromJson(map, assetResolver) {
    belongsToCollection = map["belongs_to_collection"]
        ? new Collection.fromJson(map["belongs_to_collection"], assetResolver)
        : null;
    budget = map["budget"];
    genres = Genre.listFromJson(map["genres"]);
    homepage = map["homepage"];
    imdbId = map["imdb_id"];
    productionCompanies =
        Company.listFromJson(map["production_companies"], assetResolver);
    productionCountries = Country.listFromJson(map["production_countries"]);
    revenue = map["revenue"];
    runtime = map["runtime"];
    spokenLanguages = Country.listFromJson(map["spoken_languages"]);
    status = map["status"];
    tagline = map["tagline"];
    images = map["images"] != null
        ? new ImageCollection.fromJson(map["images"], assetResolver)
        : null;
  }
}
