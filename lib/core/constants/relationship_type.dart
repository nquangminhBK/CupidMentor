import 'package:collection/collection.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';

enum RelationshipType {
  crush(
    'crush',
    LocalizationContent(
      content: {
        LocalizationEnum.english: 'Crush',
        LocalizationEnum.vietnamese: 'Người thầm thích',
        LocalizationEnum.japanese: '打ち砕く',
      },
    ),
  ),
  friends(
    'friends',
    LocalizationContent(
      content: {
        LocalizationEnum.english: 'Friends',
        LocalizationEnum.vietnamese: 'Bạn đặc biệt',
        LocalizationEnum.japanese: '特別な友達',
      },
    ),
  ),
  lover(
    'lover',
    LocalizationContent(
      content: {
        LocalizationEnum.english: 'Lover',
        LocalizationEnum.vietnamese: 'Người yêu',
        LocalizationEnum.japanese: '愛人',
      },
    ),
  );

  final String value;

  final LocalizationContent displayText;

  const RelationshipType(this.value, this.displayText);

  static RelationshipType? tryParse(String value) => RelationshipType.values.firstWhereOrNull(
        (element) => element.value.toLowerCase() == value.toLowerCase(),
      );

  static List<RelationshipType> relationshipTypes() =>
      [RelationshipType.crush, RelationshipType.friends, RelationshipType.lover];
}
