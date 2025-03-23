library flutter_resizer;

import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? screenWidthPercent;
  static double? screenHeightPercent;
  static TextScaler? textScaleFactor;
  static double? pixelRatio;
  static Orientation? orientation;

  static double designWidth = 360;
  static double designHeight = 640;

  static const double smallScreenWidth = 360;
  static const double mediumScreenWidth = 600;
  static const double largeScreenWidth = 900;

  // Initialize SizeConfig with the current context
  static void init(BuildContext context, {double? customDesignWidth, double? customDesignHeight}) {
    final mediaQuery = MediaQuery.of(context);

    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    screenWidthPercent = screenWidth! / 100;
    screenHeightPercent = screenHeight! / 100;
    textScaleFactor = mediaQuery.textScaler;
    pixelRatio = mediaQuery.devicePixelRatio;
    orientation = mediaQuery.orientation;

    if (customDesignWidth != null) designWidth = customDesignWidth;
    if (customDesignHeight != null) designHeight = customDesignHeight;
  }

  // Check if SizeConfig is initialized
  static void checkInitialized() {
    assert(screenWidth != null, 'SizeConfig must be initialized before use.');
  }

  // Responsive width based on design size
  static double responsiveWidth(double width) {
    checkInitialized();
    return (width / designWidth) * screenWidth!;
  }

  // Responsive height based on design size
  static double responsiveHeight(double height) {
    checkInitialized();
    return (height / designHeight) * screenHeight!;
  }

  // Responsive font size based on design size and system text scaling
  static double responsiveFont(double fontSize, {bool ignoreTextScaling = false}) {
    checkInitialized();
    final scaledFontSize = (fontSize / designWidth) * screenWidth!;
    return ignoreTextScaling ? scaledFontSize : textScaleFactor!.scale(scaledFontSize);
  }

  // Density-independent pixels (dp)
  static double toDp(double value, {bool ignoreTextScaling = false}) {
    checkInitialized();
    return ignoreTextScaling ? value : textScaleFactor!.scale(value);
  }

  // Aspect ratio calculation
  static double get aspectRatio {
    checkInitialized();
    return screenWidth! / screenHeight!;
  }

  // Screen size breakpoints
  static bool get isSmallScreen {
    checkInitialized();
    return screenWidth! < smallScreenWidth;
  }

  static bool get isMediumScreen {
    checkInitialized();
    return screenWidth! >= smallScreenWidth && screenWidth! < largeScreenWidth;
  }

  static bool get isLargeScreen {
    checkInitialized();
    return screenWidth! >= largeScreenWidth;
  }

  // Orientation helpers
  static bool get isPortrait {
    checkInitialized();
    return orientation == Orientation.portrait;
  }

  static bool get isLandscape {
    checkInitialized();
    return orientation == Orientation.landscape;
  }
}

extension ResponsiveSizing on num {
  double get w => SizeConfig.responsiveWidth(toDouble());

  double get h => SizeConfig.responsiveHeight(toDouble());

  double get sp => SizeConfig.responsiveFont(toDouble());

  double get dp => SizeConfig.toDp(toDouble());

  SizedBox get height => SizedBox(height: h);

  SizedBox get width => SizedBox(width: w);
}
