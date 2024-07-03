/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/anniversary_image.png
  AssetGenImage get anniversaryImage => const AssetGenImage('assets/png/anniversary_image.png');

  /// File path: assets/png/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/png/app_icon.png');

  /// File path: assets/png/birthday_image.png
  AssetGenImage get birthdayImage => const AssetGenImage('assets/png/birthday_image.png');

  /// File path: assets/png/casual_image.png
  AssetGenImage get casualImage => const AssetGenImage('assets/png/casual_image.png');

  /// File path: assets/png/christmas_image.png
  AssetGenImage get christmasImage => const AssetGenImage('assets/png/christmas_image.png');

  /// File path: assets/png/dating_delight_image.png
  AssetGenImage get datingDelightImage =>
      const AssetGenImage('assets/png/dating_delight_image.png');

  /// File path: assets/png/gift_menu_image.png
  AssetGenImage get giftMenuImage => const AssetGenImage('assets/png/gift_menu_image.png');

  /// File path: assets/png/mens_day_image.png
  AssetGenImage get mensDayImage => const AssetGenImage('assets/png/mens_day_image.png');

  /// File path: assets/png/profile_prowess_image.png
  AssetGenImage get profileProwessImage =>
      const AssetGenImage('assets/png/profile_prowess_image.png');

  /// File path: assets/png/self_enhancement_image.png
  AssetGenImage get selfEnhancementImage =>
      const AssetGenImage('assets/png/self_enhancement_image.png');

  /// File path: assets/png/spot_menu_image.png
  AssetGenImage get spotMenuImage => const AssetGenImage('assets/png/spot_menu_image.png');

  /// File path: assets/png/thanksgiving_image.png
  AssetGenImage get thanksgivingImage => const AssetGenImage('assets/png/thanksgiving_image.png');

  /// File path: assets/png/tip_menu_image.png
  AssetGenImage get tipMenuImage => const AssetGenImage('assets/png/tip_menu_image.png');

  /// File path: assets/png/valentine_image.png
  AssetGenImage get valentineImage => const AssetGenImage('assets/png/valentine_image.png');

  /// File path: assets/png/welcome_dark.png
  AssetGenImage get welcomeDark => const AssetGenImage('assets/png/welcome_dark.png');

  /// File path: assets/png/womens_day_images.png
  AssetGenImage get womensDayImages => const AssetGenImage('assets/png/womens_day_images.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        anniversaryImage,
        appIcon,
        birthdayImage,
        casualImage,
        christmasImage,
        datingDelightImage,
        giftMenuImage,
        mensDayImage,
        profileProwessImage,
        selfEnhancementImage,
        spotMenuImage,
        thanksgivingImage,
        tipMenuImage,
        valentineImage,
        welcomeDark,
        womensDayImages
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/apple_icon.svg
  SvgGenImage get appleIcon => const SvgGenImage('assets/svg/apple_icon.svg');

  /// File path: assets/svg/background_chat_now.svg
  SvgGenImage get backgroundChatNow => const SvgGenImage('assets/svg/background_chat_now.svg');

  /// File path: assets/svg/dating_delight_bg_text.svg
  SvgGenImage get datingDelightBgText => const SvgGenImage('assets/svg/dating_delight_bg_text.svg');

  /// File path: assets/svg/google_icon.svg
  SvgGenImage get googleIcon => const SvgGenImage('assets/svg/google_icon.svg');

  /// File path: assets/svg/icon_valentine.svg
  SvgGenImage get iconValentine => const SvgGenImage('assets/svg/icon_valentine.svg');

  /// File path: assets/svg/profile_prowess_bg_text.svg
  SvgGenImage get profileProwessBgText =>
      const SvgGenImage('assets/svg/profile_prowess_bg_text.svg');

  /// File path: assets/svg/self_enhancement_bg_text.svg
  SvgGenImage get selfEnhancementBgText =>
      const SvgGenImage('assets/svg/self_enhancement_bg_text.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appleIcon,
        backgroundChatNow,
        datingDelightBgText,
        googleIcon,
        iconValentine,
        profileProwessBgText,
        selfEnhancementBgText
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName, assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
