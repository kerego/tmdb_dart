class MovieAppendSettings {
  final bool includeAlternativeTitles;
  final bool includeImages;
  final bool includeCredits;
  final bool includeExternalIds;
  final bool includeKeywords;
  final bool includeReleaseDates;
  final bool includeVideos;
  final bool includeTranslations;
  final bool includeRecommendations;
  final bool includeSimilarMovies;
  final bool includeReviews;

  MovieAppendSettings({
    this.includeAlternativeTitles = false,
    this.includeImages = true,
    this.includeCredits = true,
    this.includeExternalIds = false,
    this.includeKeywords = false,
    this.includeReleaseDates = false,
    this.includeVideos = true,
    this.includeTranslations = false,
    this.includeRecommendations = true,
    this.includeSimilarMovies = true,
    this.includeReviews = false,
  });

  @override
  String toString() {
    var buffer = StringBuffer();
    if (includeAlternativeTitles) {
      buffer.write("alternative_titles,");
    }
    if (includeImages) {
      buffer.write("images,");
    }
    if (includeCredits) {
      buffer.write("credits,");
    }
    if (includeExternalIds) {
      buffer.write("external_ids,");
    }
    if (includeKeywords) {
      buffer.write("keywords,");
    }
    if (includeReleaseDates) {
      buffer.write("release_dates,");
    }
    if (includeVideos) {
      buffer.write("videos,");
    }
    if (includeTranslations) {
      buffer.write("translations,");
    }
    if (includeRecommendations) {
      buffer.write("recommendations,");
    }
    if (includeSimilarMovies) {
      buffer.write("similar_movies,");
    }
    if (includeReviews) {
      buffer.write("reviews,");
    }

    return buffer.toString();
  }
}
