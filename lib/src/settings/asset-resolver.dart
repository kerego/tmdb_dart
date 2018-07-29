import 'package:tmdb_dart/tmdb_dart.dart';

class AssetResolver {
  Configuration _configuration;
  QualitySettings _qualitySettings;
  AssetResolver(this._configuration, this._qualitySettings) {}

  getBackdropPath(String assetUrl) {
    return _getPathWithResolution(assetUrl, _configuration.backdropSizes,
        _qualitySettings.backdropQuality);
  }

  getLogoPath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.logoSizes, _qualitySettings.logoQuality);
  }

  getPosterPath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.posterSizes, _qualitySettings.posterQuality);
  }

  getProfilePath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.profileSizes, _qualitySettings.profileQuality);
  }

  getStillPath(String assetUrl) {
    return _getPathWithResolution(
        assetUrl, _configuration.stillSizes, _qualitySettings.stillQuality);
  }

  _getPathWithResolution(
      String contentUrl, List<String> sizes, AssetQuality resolution) {
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
    if (size < 0)
      size = 0;
    else if (size > sizes.length - 1) size = sizes.length - 1;

    var sizeUrl = sizes[size];
    return "${_configuration.secureBaseUrl}$sizeUrl$contentUrl";
  }
}

enum AssetQuality {
  Lowest,
  Mid,
  Highest,
}
