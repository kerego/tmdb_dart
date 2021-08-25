import '../models/asset-quality.dart';

class QualitySettings {
  final AssetQuality? posterQuality;
  final AssetQuality? backdropQuality;
  final AssetQuality? logoQuality;
  final AssetQuality? profileQuality;
  final AssetQuality? stillQuality;

  const QualitySettings({
    this.posterQuality = AssetQuality.Mid,
    this.backdropQuality = AssetQuality.Mid,
    this.logoQuality = AssetQuality.Mid,
    this.profileQuality = AssetQuality.Mid,
    this.stillQuality = AssetQuality.Mid,
  });
}
