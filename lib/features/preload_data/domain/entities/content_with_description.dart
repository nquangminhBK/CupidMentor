import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_with_description.freezed.dart';

@freezed
class ContentWithDescription with _$ContentWithDescription {
  const ContentWithDescription._();

  const factory ContentWithDescription({
    required String id,
    required LocalizationContent title,
    required LocalizationContent description,
  }) = _ContentWithDescription;

  factory ContentWithDescription.empty() => ContentWithDescription(
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
