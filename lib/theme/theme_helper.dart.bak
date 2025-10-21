import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  final _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get gray_900 => Color(0xFF1C2127);
  Color get blue_gray_900 => Color(0xFF2A2F36);
  Color get gray_900_01 => Color(0xFF20252B);
  Color get cyan_100 => Color(0xFFABE2F3);
  Color get teal_100 => Color(0xFFBDE4E5);
  Color get light_green_100 => Color(0xFFEBE9D0);
  Color get blue_100 => Color(0xFFC0CFFE);
  Color get purple_50 => Color(0xFFF3DFF4);
  Color get pink_50 => Color(0xFFF9D8E5);
  Color get blue_A200 => Color(0xFF5283FF);
  Color get blue_A200_23 => Color(0x235C8AFE);
  Color get black_900 => Color(0xFF000000);
  Color get light_blue_200 => Color(0xFF85D1F0);
  Color get blue_gray_200 => Color(0xFFA7B1BC);
  Color get blue_gray_900_01 => Color(0xFF262932);
  Color get green_A700 => Color(0xFF17B169);
  Color get green_400 => Color(0xFF58BC7C);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get whiteCustom => Colors.white;
  Color get greyCustom => Colors.grey;
  Color get colorFF235C => Color(0xFF235C8A);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
