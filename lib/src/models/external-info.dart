class ExternalInfo {
  final String imdbId;
  final String? facebookId;
  final String? instagramId;
  final String? twitterId;

  ExternalInfo.fromJson(Map<String, dynamic> map)
      : imdbId = map["imdb_id"],
        facebookId = map["facebook_id"],
        instagramId = map["instagram_id"],
        twitterId = map["twitter_id"];
}
