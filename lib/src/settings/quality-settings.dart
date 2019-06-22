import 'asset-resolver.dart';

class QualitySettings {
  AssetQuality posterQuality;
  AssetQuality backdropQuality;
  AssetQuality logoQuality;
  AssetQuality profileQuality;
  AssetQuality stillQuality;

  QualitySettings(
      {this.posterQuality = AssetQuality.Mid,
      this.backdropQuality = AssetQuality.Mid,
      this.logoQuality = AssetQuality.Mid,
      this.profileQuality = AssetQuality.Mid,
      this.stillQuality = AssetQuality.Mid}) {}
}
