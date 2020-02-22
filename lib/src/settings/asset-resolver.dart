import 'configuration.dart';
import 'quality-settings.dart';

class AssetResolver {
  Configuration _configuration;
  QualitySettings _qualitySettings;
  AssetResolver(this._configuration, this._qualitySettings);

  String getBackdropPath(String assetUrl) {
    return _getPathWithResolution(assetUrl, _configuration.backdropSizes,
        _qualitySettings.backdropQuality);
  }

  String getLogoPath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.logoSizes, _qualitySettings.logoQuality);
  }

  String getPosterPath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.posterSizes, _qualitySettings.posterQuality);
  }

  String getProfilePath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.profileSizes, _qualitySettings.profileQuality);
  }

  String getStillPath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.stillSizes, _qualitySettings.stillQuality);
  }

  String _getPathWithResolution(
    String contentUrl,
    List<String> sizes,
    AssetQuality resolution,
  ) {
    if (contentUrl == null || contentUrl.isEmpty) return null;

    switch (resolution) {
      case AssetQuality.Original:
        return _getPathWithSize(
          contentUrl,
          sizes[sizes.length - 1],
        );
      case AssetQuality.High:
        return _getPathWithSize(
          contentUrl,
          sizes[(sizes.length - 2).clamp(0, sizes.length)],
        );
      case AssetQuality.Low:
        return _getPathWithSize(
          contentUrl,
          sizes[0],
        );
      case AssetQuality.Mid:
      default:
        return _getPathWithSize(
          contentUrl,
          sizes[((sizes.length - 1) / 2).round()],
        );
    }
  }

  String _getPathWithSize(
    String contentUrl,
    String sizeUrl,
  ) =>
      "${_configuration.secureBaseUrl}$sizeUrl$contentUrl";
}

enum AssetQuality {
  Low,
  Mid,
  High,
  Original,
}
