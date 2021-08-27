class ExternalInfo {
  late final String imdbId;
  late final String? facebookId;
  late final String? instagramId;
  late final String? twitterId;

  ExternalInfo.fromJson(Map<String, dynamic> map) {
    imdbId = map["imdb_id"];
    facebookId = map["facebook_id"];
    instagramId = map["instagram_id"];
    twitterId = map["twitter_id"];
  }
}
