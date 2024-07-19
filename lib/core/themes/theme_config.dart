// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:pinterest_clone/constants/config_constant.dart';
import 'package:pinterest_clone/core/themes/m3/m3_color.dart';
import 'package:pinterest_clone/core/themes/theme_constant.dart';

class ThemeConfig {
  final bool isDarkMode;

  ThemeConfig(this.isDarkMode);
  ThemeConfig.fromDarkMode(this.isDarkMode);

  // static bool get useWebTheme => false;
  static bool get useWebTheme => foundation.kIsWeb;

  static double webBreakpoint = 1000;

  static EdgeInsetsGeometry getPagePadding({
    required double width,
    required EdgeInsets fallback,
    double? webVerticalPadding,
  }) {
    if (useWebTheme && width > ThemeConfig.webBreakpoint) {
      return EdgeInsets.symmetric(
        horizontal: (width - ThemeConfig.webBreakpoint) / 2,
        vertical: webVerticalPadding ?? 0.0,
      );
    } else {
      return fallback;
    }
  }

  factory ThemeConfig.light() {
    return ThemeConfig.fromDarkMode(false);
  }

  factory ThemeConfig.dark() {
    return ThemeConfig.fromDarkMode(true);
  }

  ColorScheme get _light => M3Color.instance.colorScheme(true);
  ColorScheme get _dark => M3Color.instance.colorScheme(false);

  ThemeData get themeData {
    ColorScheme colorScheme = M3Color.instance.colorScheme(isDarkMode);
    TextTheme textTheme = buildTextTheme(colorScheme);

    final themeData = ThemeData(
      // platform: TargetPlatform.android,
      useMaterial3: true,
      applyElevationOverlayColor: true,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      colorScheme: colorScheme,
      switchTheme: buildSwitchTheme(colorScheme),
      radioTheme: buildRadioTheme(colorScheme),
      checkboxTheme: buildCheckboxTheme(colorScheme),
      shadowColor: colorScheme.shadow,
      dividerColor: getDividerColor(colorScheme),
      dividerTheme: DividerThemeData(
        color: getDividerColor(colorScheme),
      ),
      appBarTheme: AppBarTheme(
        shadowColor: colorScheme.outline,
        // shadowColor: colorScheme.shadow,
        backgroundColor: colorScheme.surface,
        surfaceTintColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        centerTitle: false,
        elevation: 0.5,
        scrolledUnderElevation: 0.5,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        enableFeedback: true,
        elevation: 2.0,
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        extendedPadding: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2 + 4),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurface,
        labelStyle: textTheme.titleSmall,
        unselectedLabelStyle: textTheme.titleSmall,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0.0,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF323232),
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: _dark.surface),
        actionTextColor: _light.primary,
        shape: RoundedRectangleBorder(
          borderRadius: ConfigConstant.circlarRadius1,
        ),
      ),
      drawerTheme: const DrawerThemeData(shape: RoundedRectangleBorder(), endShape: RoundedRectangleBorder()),
      indicatorColor: colorScheme.onPrimary,
      textTheme: textTheme,
      textButtonTheme: buildTextButtonStyle(colorScheme),
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
    );

    return withDefault(themeData);
  }

  Color getDividerColor(ColorScheme colorScheme) {
    return isDarkMode ? colorScheme.outline : const Color(0xFFF2F2F2);
  }

  CheckboxThemeData buildCheckboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
    );
  }

  RadioThemeData buildRadioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
    );
  }

  SwitchThemeData buildSwitchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) return null;
        if (states.contains(WidgetState.selected)) return colorScheme.primary;
        return null;
      }),
    );
  }

  TextButtonThemeData buildTextButtonStyle(ColorScheme colorScheme) {
    return const TextButtonThemeData();
  }

  static TextTheme buildTextTheme(ColorScheme colorScheme) {
    return ThemeConstant.defaultTextTheme.apply(
      fontFamily: ThemeConstant.defaultFontFamily,
      fontFamilyFallback: ThemeConstant.fontFamilyFallback,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      decorationColor: colorScheme.onSurface,
    );
  }

  static ThemeData withDefault(ThemeData themeData) {
    return themeData.copyWith(
      splashFactory: splashFactory(themeData.platform),
      textTheme: buildTextTheme(themeData.colorScheme),
      textButtonTheme: TextButtonThemeData(
        style: (themeData.textButtonTheme.style ?? const ButtonStyle()).copyWith(
          splashFactory: splashFactory(themeData.platform),
        ),
      ),
    );
  }

  static InteractiveInkFeatureFactory splashFactory(TargetPlatform platform) {
    // InkSparkle.splashFactory,
    // InkRipple.splashFactory,
    // InkSplash.splashFactory,
    // NoSplash.splashFactory
    return isApple(platform) ? NoSplash.splashFactory : InkSparkle.splashFactory;
  }

  static ThemeData minimizedTheme(BuildContext context) {
    return withDefault(
      ThemeData.from(colorScheme: M3Color.of(context)),
    );
  }

  static bool isApple(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }
}
