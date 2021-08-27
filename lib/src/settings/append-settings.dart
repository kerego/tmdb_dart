/// Include additional information about the movie in the response
class AppendSettings {
  /// Include all of the alternative titles for a movie.
  final bool includeAlternativeTitles;

  /// Include the images for a movie
  final bool includeImages;

  /// Include the credits for a movie
  final bool includeCredits;

  /// Get the external ids for a movie. We currently support: IDMb Id, Facebook, Instagram, Twitter
  final bool includeExternalIds;

  /// Include the keywords for a movie
  final bool includeKeywords;

  /// Include the release date along with the certification for a movie.
  final bool includeReleaseDates;

  /// Include the videos that have been added to a movie.
  final bool includeVideos;

  /// Include a list of translations that have been created for a movie.
  final bool includeTranslations;

  /// Include a list of recommended movies for a movie.
  final bool includeRecommendations;

  /// Include a list of similar movies. This is **not** the same as the "Recommendation" system you see on the website.
  final bool includeSimilarContent;

  /// Include the reviews for a movie
  final bool includeReviews;

  const AppendSettings({
    this.includeAlternativeTitles = false,
    this.includeImages = false,
    this.includeCredits = false,
    this.includeExternalIds = false,
    this.includeKeywords = false,
    this.includeReleaseDates = false,
    this.includeVideos = false,
    this.includeTranslations = false,
    this.includeRecommendations = false,
    this.includeSimilarContent = false,
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
    if (includeSimilarContent) {
      buffer.write("similar,");
    }
    if (includeReviews) {
      buffer.write("reviews,");
    }

    return buffer.toString();
  }
}
