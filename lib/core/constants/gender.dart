import 'package:collection/collection.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';

enum Gender {
  male(
    'male',
    LocalizationContent(
      content: {
        LocalizationEnum.english: 'Male',
        LocalizationEnum.vietnamese: 'Nam giới',
        LocalizationEnum.japanese: '男性',
      },
    ),
  ),
  female(
    'female',
    LocalizationContent(
      content: {
        LocalizationEnum.english: 'Female',
        LocalizationEnum.vietnamese: 'Nữ giới',
        LocalizationEnum.japanese: '女性',
      },
    ),
  ),
  other(
    'other',
    LocalizationContent(
      content: {
        LocalizationEnum.english: 'Other',
        LocalizationEnum.vietnamese: 'Khác',
        LocalizationEnum.japanese: '他の性別',
      },
    ),
  );

  final String value;

  final LocalizationContent displayText;

  const Gender(this.value, this.displayText);

  static Gender? tryParse(String value) => Gender.values.firstWhereOrNull(
        (element) => element.value.toLowerCase() == value.toLowerCase(),
      );
}
