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

  _getPathWithResolution(
      String contentUrl, List<String> sizes, AssetQuality resolution) {
    if (contentUrl == null || contentUrl.isEmpty) {
      return null;
    }

    switch (resolution) {
      case AssetQuality.Highest:
        return _getPathWithSize(contentUrl, sizes, sizes.length - 1);
      case AssetQuality.Lowest:
        return _getPathWithSize(contentUrl, sizes, 0);
      case AssetQuality.Mid:
        return _getPathWithSize(contentUrl, sizes, (sizes.length / 2).round());
    }
  }

  _getPathWithSize(String contentUrl, List<String> sizes, int size) {
    final clampedSize = size.clamp(0, sizes.length - 1);

    final sizeUrl = sizes[clampedSize];
    return "${_configuration.secureBaseUrl}$sizeUrl$contentUrl";
  }
}

enum AssetQuality {
  Lowest,
  Mid,
  Highest,
}
