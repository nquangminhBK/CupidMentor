import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'love_language.freezed.dart';

@freezed
class LoveLanguage with _$LoveLanguage {
  const LoveLanguage._();

  const factory LoveLanguage({
    required String id,
    required LocalizationContent title,
    required LocalizationContent description,
  }) = _LoveLanguage;

  factory LoveLanguage.empty() => LoveLanguage(
        id: '',
        title: LocalizationContent.empty(),
        description: LocalizationContent.empty(),
      );

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
