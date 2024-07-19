import 'package:flutter/material.dart';
import 'package:pinterest_clone/core/themes/m3/m3_color.dart';
import 'package:pinterest_clone/core/themes/m3/m3_text_theme.dart';
import 'package:pinterest_clone/widgets/app_scope.dart';

enum PrButtonSize { tiny, small, medium }

const _defaultTitlePadding = EdgeInsets.symmetric(horizontal: 8.0);

class PrButton extends StatelessWidget {
  const PrButton({
    super.key,
    this.onPressed,
    required this.label,
    this.iconData,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.disableBackgroundColor,
    this.disableForegroundColor,
    this.disableBorderColor,
    this.borderRadius,
    this.size = PrButtonSize.small,
    this.titlePadding = _defaultTitlePadding,
    this.width,
  });

  final VoidCallback? onPressed;
  final String label;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color? disableBackgroundColor;
  final Color? disableForegroundColor;
  final Color? disableBorderColor;
  final PrButtonSize size;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets titlePadding;
  final double? width;

  factory PrButton.filled({
    Key? key,
    required String label,
    IconData? iconData,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disableBackgroundColor,
    Color? disableForegroundColor,
    PrButtonSize size = PrButtonSize.small,
    EdgeInsets titlePadding = _defaultTitlePadding,
    double? width,
  }) {
    ColorScheme? colorScheme = getColorScheme();
    return PrButton(
      key: key,
      onPressed: onPressed,
      label: label,
      iconData: iconData,
      backgroundColor: backgroundColor ?? colorScheme?.primary,
      foregroundColor: foregroundColor ?? colorScheme?.onPrimary,
      borderColor: null,
      disableBackgroundColor: disableBackgroundColor ?? colorScheme?.onSurface.withOpacity(0.12),
      disableForegroundColor: disableForegroundColor ?? colorScheme?.onSurface.withOpacity(0.38),
      disableBorderColor: null,
      size: size,
      titlePadding: titlePadding,
      width: width,
    );
  }

  factory PrButton.tonal({
    Key? key,
    required String label,
    IconData? iconData,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? disableBackgroundColor,
    Color? disableForegroundColor,
    PrButtonSize size = PrButtonSize.small,
    EdgeInsets titlePadding = _defaultTitlePadding,
    double? width,
  }) {
    ColorScheme? colorScheme = getColorScheme();
    return PrButton(
      key: key,
      onPressed: onPressed,
      label: label,
      iconData: iconData,
      backgroundColor: backgroundColor ?? colorScheme?.secondaryContainer,
      foregroundColor: foregroundColor ?? colorScheme?.onSecondaryContainer,
      borderColor: null,
      disableBackgroundColor: disableBackgroundColor ?? colorScheme?.onSurface.withOpacity(0.12),
      disableForegroundColor: disableForegroundColor ?? colorScheme?.onSurface.withOpacity(0.38),
      disableBorderColor: null,
      size: size,
      titlePadding: titlePadding,
      width: width,
    );
  }

  static ColorScheme? getColorScheme() => AppScope.globalContext != null ? M3Color.of(AppScope.globalContext!) : null;

  factory PrButton.outlined({
    Key? key,
    required String label,
    IconData? iconData,
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? disableBackgroundColor,
    Color? disableForegroundColor,
    Color? disableBorderColor,
    PrButtonSize size = PrButtonSize.small,
    EdgeInsets titlePadding = _defaultTitlePadding,
    double? width,
  }) {
    ColorScheme? colorScheme = getColorScheme();
    return PrButton(
      key: key,
      onPressed: onPressed,
      label: label,
      iconData: iconData,
      backgroundColor: backgroundColor ?? colorScheme?.surface,
      foregroundColor: foregroundColor ?? colorScheme?.primary,
      borderColor: borderColor ?? colorScheme?.outline,
      disableBackgroundColor: disableBackgroundColor ?? Colors.transparent,
      disableForegroundColor: disableForegroundColor ?? colorScheme?.onSurface.withOpacity(0.38),
      disableBorderColor: disableBorderColor ?? colorScheme?.onSurface.withOpacity(0.28),
      borderRadius: null,
      size: size,
      titlePadding: titlePadding,
      width: width,
    );
  }

  factory PrButton.text({
    Key? key,
    required String label,
    IconData? iconData,
    VoidCallback? onPressed,
    Color? foregroundColor,
    Color? disableForegroundColor,
    PrButtonSize size = PrButtonSize.small,
    EdgeInsets titlePadding = _defaultTitlePadding,
    double? width,
  }) {
    ColorScheme? colorScheme = getColorScheme();
    return PrButton(
      key: key,
      onPressed: onPressed,
      label: label,
      iconData: iconData,
      backgroundColor: Colors.transparent,
      foregroundColor: foregroundColor ?? colorScheme?.primary,
      borderColor: null,
      disableBackgroundColor: Colors.transparent,
      disableForegroundColor: disableForegroundColor ?? colorScheme?.onSurface.withOpacity(0.38),
      disableBorderColor: null,
      borderRadius: null,
      size: size,
      titlePadding: titlePadding,
      width: width,
    );
  }

  PrButton copyWith({
    Key? key,
    VoidCallback? onPressed,
    String? label,
    IconData? iconData,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? disableBackgroundColor,
    Color? disableForegroundColor,
    Color? disableBorderColor,
    PrButtonSize? size,
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? titlePadding,
    double? width,
    bool? disable,
  }) {
    if (disable != null) {
      if (disable) {
        onPressed = null;
      } else {
        onPressed ??= this.onPressed;
      }
    } else {
      onPressed ??= this.onPressed;
    }

    return PrButton(
      key: key ?? this.key,
      onPressed: onPressed,
      label: label ?? this.label,
      iconData: iconData ?? this.iconData,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      borderColor: borderColor ?? this.borderColor,
      disableBackgroundColor: disableBackgroundColor ?? this.disableBackgroundColor,
      disableForegroundColor: disableForegroundColor ?? this.disableForegroundColor,
      disableBorderColor: disableBorderColor ?? this.disableBorderColor,
      size: size ?? this.size,
      borderRadius: borderRadius ?? this.borderRadius,
      titlePadding: titlePadding ?? this.titlePadding,
      width: width,
    );
  }

  double get height {
    switch (size) {
      case PrButtonSize.tiny:
        return 36;
      case PrButtonSize.small:
        return 40;
      case PrButtonSize.medium:
        return 48;
    }
  }

  EdgeInsets get titlePaddingGetter {
    switch (size) {
      case PrButtonSize.tiny:
        bool isDefault = titlePadding == _defaultTitlePadding;
        if (isDefault) return const EdgeInsets.symmetric(horizontal: 4.0);
        return titlePadding;
      case PrButtonSize.small:
        return titlePadding;
      case PrButtonSize.medium:
        bool isDefault = titlePadding == _defaultTitlePadding;
        if (isDefault) return const EdgeInsets.symmetric(horizontal: 16.0);
        return titlePadding;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: buildButton(context),
    );
  }

  Widget buildButton(BuildContext context) {
    bool disable = onPressed == null;

    Color? foregroundColorInner = disable ? disableForegroundColor : foregroundColor ?? M3Color.of(context).onPrimary;
    Color? backgroundColorInner = disable ? disableBackgroundColor : backgroundColor ?? M3Color.of(context).primary;
    Color? borderColorInner = disable ? disableBorderColor : borderColor;

    if (iconData != null) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData, color: foregroundColorInner),
        style: buildButtonStyle(backgroundColorInner, borderColorInner),
        label: buildLabel(context, foregroundColorInner),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        style: buildButtonStyle(backgroundColorInner, borderColorInner),
        child: buildLabel(context, foregroundColorInner),
      );
    }
  }

  ButtonStyle buildButtonStyle(Color? backgroundColor, Color? borderColor) {
    return TextButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(48),
        side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
      ),
    );
  }

  Widget buildLabel(BuildContext context, Color? foregroundColor) {
    return Padding(
      padding: titlePaddingGetter,
      child: Text(
        label,
        style: M3TextTheme.of(context).labelLarge?.copyWith(color: foregroundColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
