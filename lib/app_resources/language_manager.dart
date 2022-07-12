enum LanguageType { ENGLISH, ARABIC }

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ARABIC:
        return "ar";
      case LanguageType.ENGLISH:
        return "en";
    }
  }
}
