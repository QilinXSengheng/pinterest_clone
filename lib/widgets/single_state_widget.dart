import 'package:flutter/material.dart';

class SingleStateWidget<T> extends StatefulWidget {
  const SingleStateWidget({
    super.key,
    required this.initialValue,
    required this.builder,
  });

  final T initialValue;
  final Widget Function(BuildContext context, ValueNotifier<T> notifier) builder;

  @override
  State<SingleStateWidget<T>> createState() => _SingleStateWidgetState<T>();
}

class _SingleStateWidgetState<T> extends State<SingleStateWidget<T>> {
  late final ValueNotifier<T> stateNotifier;

  @override
  void initState() {
    stateNotifier = ValueNotifier<T>(widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    stateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      stateNotifier,
    );
  }
}
