enum LocalizationEnum {
  english('en'),
  vietnamese('vi'),
  japanese('ja');

  final String value;

  const LocalizationEnum(this.value);

  static LocalizationEnum parse(String theme) => LocalizationEnum.values
      .firstWhere((element) => element.value == theme, orElse: () => LocalizationEnum.english);
}
