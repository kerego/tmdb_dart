import '../models/asset-quality.dart';

import 'configuration.dart';
import 'quality-settings.dart';

class AssetResolver {
  final Configuration _configuration;
  final QualitySettings _qualitySettings;

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

    String sizeUrl;
    switch (resolution) {
      case AssetQuality.Original:
        sizeUrl = sizes[sizes.length - 1];
        break;
      case AssetQuality.High:
        sizeUrl = sizes[(sizes.length - 2).clamp(0, sizes.length)];
        break;
      case AssetQuality.Low:
        sizeUrl = sizes[0];
        break;
      case AssetQuality.Mid:
      default:
        sizeUrl =
            sizes[((sizes.length - 2) / 2).round().clamp(0, sizes.length)];
    }

    return "${_configuration.secureBaseUrl}$sizeUrl$contentUrl";
  }
}
