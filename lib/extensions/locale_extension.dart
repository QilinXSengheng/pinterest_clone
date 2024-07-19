import 'package:flutter/material.dart';

extension LocaleExtension on Locale {
  String? get languageName {
    switch (languageCode) {
      case 'km':
        return 'ខ្មែរ';
      case 'en':
        return 'English';
      default:
        return null;
    }
  }
}
