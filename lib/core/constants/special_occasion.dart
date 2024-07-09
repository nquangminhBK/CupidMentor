import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/core_entity/localization_content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SpecialOccasion extends Equatable {
  final Widget image;
  final LocalizationContent title;

  const SpecialOccasion({required this.image, required this.title});

  @override
  List<Object?> get props => [image, title];

  static final List<SpecialOccasion> specialOccasions = [
    SpecialOccasion(
      image: Assets.png.casualImage.image(),
      title: const LocalizationContent(
        id: 'casualDates',
        content: {
          LocalizationEnum.english: 'Casual Dates',
          LocalizationEnum.japanese: 'カジュアルデート',
          LocalizationEnum.vietnamese: 'Hẹn hò thường nhật',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.birthdayImage.image(),
      title: const LocalizationContent(
        id: 'birthday',
        content: {
          LocalizationEnum.english: 'Birthday',
          LocalizationEnum.japanese: '誕生日',
          LocalizationEnum.vietnamese: 'Sinh nhật',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.anniversaryImage.image(),
      title: const LocalizationContent(
        id: 'anniversary',
        content: {
          LocalizationEnum.english: 'Anniversary',
          LocalizationEnum.japanese: '記念日',
          LocalizationEnum.vietnamese: 'Ngày kỉ niệm',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.valentineImage.image(),
      title: const LocalizationContent(
        id: 'valentine',
        content: {
          LocalizationEnum.english: 'Valentine',
          LocalizationEnum.japanese: 'バレンタイン',
          LocalizationEnum.vietnamese: 'Lễ tình nhân',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.christmasImage.image(),
      title: const LocalizationContent(
        id: 'christmas',
        content: {
          LocalizationEnum.english: 'Christmas',
          LocalizationEnum.japanese: 'クリスマス',
          LocalizationEnum.vietnamese: 'Giáng sinh',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.thanksgivingImage.image(),
      title: const LocalizationContent(
        id: 'thanksgiving',
        content: {
          LocalizationEnum.english: 'Thanksgiving',
          LocalizationEnum.japanese: '感謝祭',
          LocalizationEnum.vietnamese: 'Lễ tạ ơn',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.mensDayImage.image(),
      title: const LocalizationContent(
        id: 'mensDay',
        content: {
          LocalizationEnum.english: "Men's Day",
          LocalizationEnum.japanese: '男性の日',
          LocalizationEnum.vietnamese: 'Quốc tế đàn ông',
        },
      ),
    ),
    SpecialOccasion(
      image: Assets.png.womensDayImages.image(),
      title: const LocalizationContent(
        id: 'womenDay',
        content: {
          LocalizationEnum.english: "Women's Day",
          LocalizationEnum.japanese: '女性の日',
          LocalizationEnum.vietnamese: 'Quốc tế phụ nữ',
        },
      ),
    ),
  ];
}
