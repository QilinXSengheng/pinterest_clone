import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/core/app_constant.dart';

class AppScope extends StatefulWidget {
  const AppScope({
    super.key,
    required this.builder,
  });

  static BuildContext? globalContext = GlobalKey<NavigatorState>().currentContext;
  final Widget Function(BuildContext context) builder;

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      useFallbackTranslations: true,
      useOnlyLangCode: true,
      saveLocale: true,
      fallbackLocale: AppConstant.fallbackLocale,
      supportedLocales: AppConstant.supportedLocales,
      path: 'assets/translations',
      child: widget.builder(context),
    );
  }
}
