import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/features/select_language/presentation/manager/localization_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_content.freezed.dart';
part 'localization_content.g.dart';

@freezed
class LocalizationContent with _$LocalizationContent {
  const LocalizationContent._();

  const factory LocalizationContent({
    String? id,
    required Map<LocalizationEnum, String> content,
  }) = _LocalizationContent;

  factory LocalizationContent.fromJson(Map<String, dynamic> json) =>
      _$LocalizationContentFromJson(json);

  factory LocalizationContent.empty() => const LocalizationContent(
        content: {},
      );

  String value(BuildContext context) {
    final currentLang = ProviderScope.containerOf(context).read(localizationNotifierProvider).lang;

    return content[currentLang] ?? '';
  }
}
