import '../models/asset-quality.dart';

/// Quality settings
class QualitySettings {
  final AssetQuality posterQuality;
  final AssetQuality backdropQuality;
  final AssetQuality logoQuality;
  final AssetQuality profileQuality;
  final AssetQuality stillQuality;

  const QualitySettings()
      : posterQuality = AssetQuality.Mid,
        backdropQuality = AssetQuality.Mid,
        logoQuality = AssetQuality.Mid,
        profileQuality = AssetQuality.Mid,
        stillQuality = AssetQuality.Mid;

  const QualitySettings.Custom({
    required this.posterQuality,
    required this.backdropQuality,
    required this.logoQuality,
    required this.profileQuality,
    required this.stillQuality,
  });
}
