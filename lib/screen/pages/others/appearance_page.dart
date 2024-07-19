import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/core/themes/theme_config.dart';
import 'package:pinterest_clone/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppearanceView extends StatefulWidget {
  const AppearanceView({super.key});

  @override
  State<AppearanceView> createState() => _AppearanceViewState();
}

class _AppearanceViewState extends State<AppearanceView> {
  String themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return tr('label.light');
      case ThemeMode.dark:
        return tr('label.dark');
      case ThemeMode.system:
        return tr('label.system');
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('view.appearance.title')),
      ),
      body: ListView(
        padding: ThemeConfig.getPagePadding(
          width: MediaQuery.of(context).size.width,
          fallback: EdgeInsets.zero,
          context: context,
        ),
        children: ThemeMode.values.map((themeMode) {
          IconData leadingIconData;
          switch (themeMode) {
            case ThemeMode.light:
              leadingIconData = Icons.wb_sunny;
              break;
            case ThemeMode.dark:
              leadingIconData = Icons.nights_stay;
              break;
            case ThemeMode.system:
              leadingIconData = Icons.phonelink_setup;
              break;
          }
          return ListTile(
            leading: Icon(leadingIconData),
            title: Text(themeModeToString(themeMode)),
            trailing: Radio(
              value: themeMode,
              onChanged: (value) => themeProvider.setThemeMode(themeMode),
              groupValue: themeProvider.themeMode,
            ),
            onTap: () => themeProvider.setThemeMode(themeMode),
          );
        }).toList(),
      ),
    );
  }
}
