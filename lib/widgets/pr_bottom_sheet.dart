import 'package:flutter/material.dart';
import 'package:pinterest_clone/widgets/base_pr_bottom_sheet.dart';

class PrBottomSheet<T> extends BasePrBottomSheet<T> {
  const PrBottomSheet({
    super.title,
    this.contentBuilder,
    super.crossAxisAlignment,
    super.message,
    super.includePlatformBottomPadding,
  });

  final Widget Function(BuildContext context)? contentBuilder;

  @override
  Widget buildBottomSheet(BuildContext context) {
    double viewInsetsBottom = MediaQuery.of(context).viewInsets.bottom;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null) buildTitle(context),
        if (message != null) buildMessage(context),
        if (contentBuilder != null) Flexible(child: Wrap(children: [contentBuilder!(context)])),
        if (includePlatformBottomPadding) SizedBox(height: MediaQuery.of(context).padding.bottom),
        SizedBox(height: viewInsetsBottom)
      ],
    );
  }
}
