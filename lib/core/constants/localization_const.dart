enum LocalizationEnum {
  english('en', 'English'),
  vietnamese('vi', 'Tiếng Việt'),
  japanese('ja', '日本語');

  final String value;
  final String displayText;

  const LocalizationEnum(this.value, this.displayText);

  static LocalizationEnum parse(String theme) => LocalizationEnum.values
      .firstWhere((element) => element.value == theme, orElse: () => LocalizationEnum.english);
}
