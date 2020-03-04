class AppendSettings {
  final bool includeAlternativeTitles;
  final bool includeImages;
  final bool includeCredits;
  final bool includeExternalIds;
  final bool includeKeywords;
  final bool includeReleaseDates;
  final bool includeVideos;
  final bool includeTranslations;
  final bool includeRecommendations;
  final bool includeSimilarContent;
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
