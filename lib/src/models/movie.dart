import '../settings/asset-resolver.dart';
import 'alternative-title.dart';
import 'video.dart';
import 'collection.dart';
import 'company.dart';
import 'country.dart';
import 'credits.dart';
import 'external-info.dart';
import 'genre.dart';
import 'image-collection.dart';
import 'keyword.dart';
import 'movie-base.dart';

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
  List<AlternativeTitle> alternativeTitles;
  Credits credits;
  ExternalInfo externalIds;
  List<Keyword> keywords;
  List<Video> videos;
  List<MovieBase> recommendations;
  List<MovieBase> similar;

  // TODO
  // ReleaseDates
  // Translations
  // Reviews

  Movie.fromJson(Map<String, dynamic> map, AssetResolver assetResolver)
      : super.fromJson(map, assetResolver) {
    belongsToCollection = map["belongs_to_collection"] != null
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

    if (map.containsKey("images"))
      images = new ImageCollection.fromJson(map["images"], assetResolver);

    if (map.containsKey("alternative_titles"))
      alternativeTitles =
          AlternativeTitle.listFromJson(map["alternative_titles"]["titles"]);

    if (map.containsKey("credits"))
      credits = Credits.fromJson(map["credits"], assetResolver);

    if (map.containsKey("external_ids"))
      externalIds = ExternalInfo.fromJson(map["external_ids"]);

    if (map.containsKey("keywords"))
      keywords = Keyword.listFromJson(map["keywords"]["keywords"]);

    if (map.containsKey("videos"))
      videos = Video.listFromJson(map["videos"]["results"]);

    if (map.containsKey("recommendations"))
      recommendations = MovieBase.listFromJson(
          map["recommendations"]["results"], assetResolver);

    if (map.containsKey("similar_movies"))
      similar = MovieBase.listFromJson(
          map["similar_movies"]["results"], assetResolver);
  }
}
