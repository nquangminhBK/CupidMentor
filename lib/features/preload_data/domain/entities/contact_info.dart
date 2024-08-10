import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_info.freezed.dart';

@freezed
class ContactInfo with _$ContactInfo {
  const ContactInfo._();

  const factory ContactInfo({
    required String email,
    required String linkedIn,
  }) = _ContactInfo;

  factory ContactInfo.empty() => const ContactInfo(
        email: '',
        linkedIn: '',
      );
}
