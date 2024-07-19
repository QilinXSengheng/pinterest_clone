import 'package:flutter/material.dart';
import 'package:pinterest_clone/core/storages/base_storages/enum_storage.dart';

class ThemeModeStorage extends EnumStorage<ThemeMode> {
  @override
  List<ThemeMode> get values => ThemeMode.values;

  static final ThemeModeStorage instance = ThemeModeStorage();
  ThemeMode? _themeMode;
  ThemeMode get themeMode => _themeMode ?? ThemeMode.light;

  Future<void> initialize() async {
    _themeMode = await readEnum();
  }

  @override
  Future<void> writeEnum(ThemeMode value) {
    _themeMode = value;
    return super.writeEnum(value);
  }
}
