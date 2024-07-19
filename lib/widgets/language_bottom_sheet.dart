import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/constants/config_constant.dart';
import 'package:pinterest_clone/extensions/locale_extension.dart';
import 'package:pinterest_clone/widgets/bottom_navigation_wrapper.dart';
import 'package:pinterest_clone/widgets/pr_bottom_sheet.dart';
import 'package:pinterest_clone/widgets/pr_button.dart';
import 'package:pinterest_clone/widgets/single_state_widget.dart';

class LanuagesBottomSheet extends PrBottomSheet {
  @override
  String? get title => tr('bottom_sheet.change_language');

  @override
  bool get includePlatformBottomPadding => false;

  @override
  Widget Function(BuildContext context) get contentBuilder {
    return (context) {
      return buildContent(context);
    };
  }

  Widget buildContent(BuildContext context) {
    return SingleStateWidget<Locale>(
      initialValue: context.locale,
      builder: (context, notifier) {
        return ValueListenableBuilder<Locale>(
          valueListenable: notifier,
          builder: (context, locale, chld) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < context.supportedLocales.length; i++) ...[
                  _buildLanguageTile(notifier, context.supportedLocales[i]),
                  // if (i != context.supportedLocales.length - 1) buildTileDivider()
                ],
                buildActionButton(context, notifier)
              ],
            );
          },
        );
      },
    );
  }

  Widget buildActionButton(BuildContext context, ValueNotifier<Locale> notifier) {
    return BottomNavigationWrapper.singleAction(
      PrButton.filled(
        label: tr('button.apply'),
        onPressed: notifier.value == context.locale
            ? null
            : () {
                context.setLocale(notifier.value);
                Navigator.of(context).pop();
              },
      ),
    );
  }

  Widget buildTileDivider() {
    return const Divider(
      height: 1,
      indent: ConfigConstant.margin2 + 24 + 16,
      endIndent: ConfigConstant.margin2 + 24 + 16,
    );
  }

  Widget _buildLanguageTile(ValueNotifier<Locale> notifier, Locale locale) {
    return buildLanguageTile(
      locale,
      notifier.value,
      () => notifier.value = locale,
    );
  }

  static Widget buildLanguageTile(
    Locale locale,
    Locale currentLocale,
    void Function() onTap,
  ) {
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        backgroundImage: AssetImage('assets/flags/${locale.languageCode}.png'),
      ),
      title: Text(locale.languageName ?? ''),
      onTap: () => onTap(),
      trailing: Radio<Locale>(
        value: locale,
        groupValue: currentLocale,
        onChanged: (value) {
          if (value == null) return;
          onTap();
        },
      ),
    );
  }
}
