/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/License.png
  AssetGenImage get license => const AssetGenImage('assets/images/License.png');

  /// File path: assets/images/Number.png
  AssetGenImage get number => const AssetGenImage('assets/images/Number.png');

  /// File path: assets/images/Number2.png
  AssetGenImage get number2 => const AssetGenImage('assets/images/Number2.png');

  /// File path: assets/images/avatar1.jpg
  AssetGenImage get avatar1 => const AssetGenImage('assets/images/avatar1.jpg');

  /// File path: assets/images/avatar2.jpg
  AssetGenImage get avatar2 => const AssetGenImage('assets/images/avatar2.jpg');

  /// File path: assets/images/avatar3.jpg
  AssetGenImage get avatar3 => const AssetGenImage('assets/images/avatar3.jpg');

  /// File path: assets/images/orange.png
  AssetGenImage get orange => const AssetGenImage('assets/images/orange.png');

  /// File path: assets/images/umniah.png
  AssetGenImage get umniah => const AssetGenImage('assets/images/umniah.png');

  /// File path: assets/images/zain.png
  AssetGenImage get zain => const AssetGenImage('assets/images/zain.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    license,
    number,
    number2,
    avatar1,
    avatar2,
    avatar3,
    orange,
    umniah,
    zain,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
