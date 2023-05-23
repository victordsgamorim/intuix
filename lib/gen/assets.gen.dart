/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  $AssetsFontsHeyComicGen get heyComic => const $AssetsFontsHeyComicGen();
  $AssetsFontsLobsterTwoGen get lobsterTwo => const $AssetsFontsLobsterTwoGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  $AssetsIconsSocialMediaGen get socialMedia =>
      const $AssetsIconsSocialMediaGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesTexturesGen get textures => const $AssetsImagesTexturesGen();
}

class $AssetsFontsHeyComicGen {
  const $AssetsFontsHeyComicGen();

  /// File path: assets/fonts/hey_comic/Hey-Comic-Bold.otf
  String get heyComicBold => 'assets/fonts/hey_comic/Hey-Comic-Bold.otf';

  /// File path: assets/fonts/hey_comic/Hey-Comic-Regular.ttf
  String get heyComicRegular => 'assets/fonts/hey_comic/Hey-Comic-Regular.ttf';

  /// List of all assets
  List<String> get values => [heyComicBold, heyComicRegular];
}

class $AssetsFontsLobsterTwoGen {
  const $AssetsFontsLobsterTwoGen();

  /// File path: assets/fonts/lobster_two/LobsterTwo-Bold.ttf
  String get lobsterTwoBold => 'assets/fonts/lobster_two/LobsterTwo-Bold.ttf';

  /// File path: assets/fonts/lobster_two/LobsterTwo-BoldItalic.ttf
  String get lobsterTwoBoldItalic =>
      'assets/fonts/lobster_two/LobsterTwo-BoldItalic.ttf';

  /// File path: assets/fonts/lobster_two/LobsterTwo-Italic.ttf
  String get lobsterTwoItalic =>
      'assets/fonts/lobster_two/LobsterTwo-Italic.ttf';

  /// File path: assets/fonts/lobster_two/LobsterTwo-Regular.ttf
  String get lobsterTwoRegular =>
      'assets/fonts/lobster_two/LobsterTwo-Regular.ttf';

  /// List of all assets
  List<String> get values => [
        lobsterTwoBold,
        lobsterTwoBoldItalic,
        lobsterTwoItalic,
        lobsterTwoRegular
      ];
}

class $AssetsIconsSocialMediaGen {
  const $AssetsIconsSocialMediaGen();

  /// File path: assets/icons/social_media/facebook_dark.svg
  String get facebookDark => 'assets/icons/social_media/facebook_dark.svg';

  /// File path: assets/icons/social_media/facebook_light.svg
  String get facebookLight => 'assets/icons/social_media/facebook_light.svg';

  /// File path: assets/icons/social_media/google_dark.svg
  String get googleDark => 'assets/icons/social_media/google_dark.svg';

  /// File path: assets/icons/social_media/google_light.svg
  String get googleLight => 'assets/icons/social_media/google_light.svg';

  /// List of all assets
  List<String> get values =>
      [facebookDark, facebookLight, googleDark, googleLight];
}

class $AssetsImagesTexturesGen {
  const $AssetsImagesTexturesGen();

  /// File path: assets/images/textures/grany.svg
  String get grany => 'assets/images/textures/grany.svg';

  /// List of all assets
  List<String> get values => [grany];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
