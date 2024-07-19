import 'package:flutter/material.dart';
import 'package:pinterest_clone/core/themes/m3/m3_text_theme.dart';

abstract class BasePrBottomSheet<T> {
  const BasePrBottomSheet({
    this.title,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.message,
    this.actionButton,
    this.includePlatformBottomPadding = true,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final String? title;
  final String? message;
  final bool includePlatformBottomPadding;
  final Widget? actionButton;

  Future<T?> show(
    BuildContext context, {
    bool useRootNavigator = true,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: useRootNavigator,
      isScrollControlled: true,
      enableDrag: false,
      showDragHandle: Theme.of(context).bottomSheetTheme.showDragHandle,
      constraints: const BoxConstraints(maxWidth: 560), // default: 640
      elevation: Theme.of(context).bottomSheetTheme.elevation,
      builder: (context) {
        return buildBottomSheet(context);
      },
    );
  }

  Widget buildBottomSheet(BuildContext context);

  Widget buildMessage(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: textAlignment,
      padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 16.0),
      child: Text(
        message!,
        style: M3TextTheme.of(context).bodyMedium,
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0).copyWith(bottom: message != null ? 8.0 : 16.0),
      alignment: textAlignment,
      child: Text(
        title!,
        style: M3TextTheme.of(context).titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildWithAction({
    required Widget child,
    required BuildContext context,
  }) {
    if (actionButton == null) return child;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: child),
        actionButton!,
      ],
    );
  }

  Alignment get textAlignment {
    Alignment alignment;
    switch (crossAxisAlignment) {
      case CrossAxisAlignment.start:
        alignment = Alignment.centerLeft;
        break;
      case CrossAxisAlignment.end:
        alignment = Alignment.centerRight;
        break;
      case CrossAxisAlignment.center:
      case CrossAxisAlignment.stretch:
      case CrossAxisAlignment.baseline:
        alignment = Alignment.center;
        break;
    }
    return alignment;
  }
}
