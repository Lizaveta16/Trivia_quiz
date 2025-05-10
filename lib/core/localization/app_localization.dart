import 'dart:ui';

class AppLocalization {
  static const String langFolderPath = 'assets/translations';

  static List<Locale> get supportedLocales => <Locale>[_ruLocale];

  static Locale get fallbackLocale => _ruLocale;
  static const Locale _ruLocale = Locale('en', 'US');
}
