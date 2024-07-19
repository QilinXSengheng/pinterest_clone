import 'package:flutter/material.dart';
import 'package:pinterest_clone/constants/config_constant.dart';
import 'package:pinterest_clone/core/themes/m3/m3_text_theme.dart';
import 'package:pinterest_clone/core/themes/theme_config.dart';
import 'package:pinterest_clone/widgets/pr_button.dart';

class BottomNavigationWrapper extends StatelessWidget {
  const BottomNavigationWrapper({
    super.key,
    required this.child,
    this.infoText,
    this.show = true,
    this.showShadow = true,
    this.transparent = false,
    this.padding = const EdgeInsets.all(16.0),
    this.includePlatformBottomPadding = true,
  });

  final Widget child;
  final String? infoText;
  final bool show;
  final bool showShadow;
  final bool transparent;
  final EdgeInsetsGeometry padding;
  final bool includePlatformBottomPadding;

  factory BottomNavigationWrapper.infoAction({
    Key? key,
    required String? headline,
    required String? value,
    required PrButton button,
    required BuildContext context,
    String? infoText,
    bool show = true,
    bool showShadow = true,
  }) {
    return BottomNavigationWrapper(
      key: key,
      show: show,
      showShadow: showShadow,
      infoText: infoText,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (headline != null || value != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (headline != null) Text(headline, style: M3TextTheme.of(context).bodyMedium),
                if (value != null)
                  Text(
                    value,
                    style: M3TextTheme.of(context).titleMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
              ],
            ),
          button.copyWith(
            size: PrButtonSize.medium,
            titlePadding: const EdgeInsets.symmetric(horizontal: 32),
          ),
        ],
      ),
    );
  }

  factory BottomNavigationWrapper.singleAction(
    PrButton button, {
    String? infoText,
    bool fullWidth = true,
    bool show = true,
    bool showShadow = true,
    bool transparent = false,
    bool includePlatformBottomPadding = true,
  }) {
    button = button.copyWith(size: PrButtonSize.medium);
    if (fullWidth) {
      return BottomNavigationWrapper(
        show: show,
        showShadow: showShadow,
        transparent: transparent,
        includePlatformBottomPadding: includePlatformBottomPadding,
        infoText: infoText,
        child: button,
      );
    } else {
      return BottomNavigationWrapper(
        show: show,
        showShadow: showShadow,
        transparent: transparent,
        includePlatformBottomPadding: includePlatformBottomPadding,
        infoText: infoText,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            button.copyWith(
              titlePadding: const EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ],
        ),
      );
    }
  }

  factory BottomNavigationWrapper.doubleActions({
    Key? key,
    required BuildContext context,
    required PrButton leftButton,
    required PrButton rightButton,
    String? infoText,
    bool show = true,
    bool showShadow = true,
  }) {
    return BottomNavigationWrapper(
      key: key,
      show: show,
      showShadow: showShadow,
      infoText: infoText,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: leftButton.copyWith(size: PrButtonSize.medium)),
          ConfigConstant.sizedBoxW1,
          Expanded(child: rightButton.copyWith(size: PrButtonSize.medium)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: buildNavigationBarConfiguration(
        child: child,
        context: context,
      ),
    );
  }

  Widget buildNavigationBarConfiguration({
    required Widget child,
    required BuildContext context,
  }) {
    final double paddingBottom = includePlatformBottomPadding ? MediaQuery.of(context).padding.bottom : 0.0;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: paddingBottom),
        margin: ThemeConfig.getPagePadding(
          width: constraints.maxWidth,
          fallback: EdgeInsets.zero,
        ),
        decoration: transparent
            ? null
            : BoxDecoration(
                color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(ConfigConstant.radius2)),
                boxShadow: boxShadow(context),
              ),
        child: Padding(
          padding: padding,
          child: buildWithInfoText(context, child),
        ),
      );
    });
  }

  Widget buildWithInfoText(BuildContext context, Widget child) {
    if (infoText == null) return child;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
            ConfigConstant.sizedBoxW1,
            Text(infoText!),
          ],
        ),
        ConfigConstant.sizedBoxH1,
        SizedBox(
          width: double.infinity,
          child: child,
        )
      ],
    );
  }

  List<BoxShadow>? boxShadow(BuildContext context) {
    if (showShadow) {
      return [
        if (Theme.of(context).colorScheme.brightness == Brightness.dark)
          BoxShadow(
            offset: const Offset(0, -1),
            color: Colors.white.withOpacity(0.1),
          )
        else
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          ),
      ];
    }
    return null;
  }
}
