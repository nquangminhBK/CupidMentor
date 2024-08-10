import 'package:cupid_mentor/features/preload_data/domain/entities/contact_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_info_model.freezed.dart';

part 'contact_info_model.g.dart';

@freezed
class ContactInfoModel with _$ContactInfoModel {
  const ContactInfoModel._();

  const factory ContactInfoModel({
    required String email,
    required String linkedIn,
  }) = _ContactInfoModel;

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) => _$ContactInfoModelFromJson(json);

  ContactInfo get toEntity {
    return ContactInfo(email: email, linkedIn: linkedIn);
  }
}
