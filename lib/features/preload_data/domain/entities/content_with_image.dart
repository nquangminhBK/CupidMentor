import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'self_improvement_category.freezed.dart';

@freezed
class SelfImprovementCategory with _$SelfImprovementCategory {
  const SelfImprovementCategory._();

  const factory SelfImprovementCategory({
    required String id,
    required LocalizationContent title,
    required String image,
  }) = _SelfImprovementCategory;

// factory LoveLanguage.empty() => LoveLanguage(
//       id: '',
//       title: LocalizationContent.empty(),
//       description: LocalizationContent.empty(),
//     );

// LoggedInUserInfoModel get toModel {
//   return LoggedInUserInfoModel(
//     genderRaw: gender?.value,
//     name: name,
//     avatar: avatar,
//     birthdayRaw: DateTimeUtils.convertToString(birthday),
//     job: job,
//     personalities: personalities,
//     hobbies: hobbies,
//     loveLanguages: loveLanguages,
//     relationship: relationship,
//     hasPartner: hasPartner,
//     partnerInfoModel: partnerInfo?.toModel,
//   );
// }
}
