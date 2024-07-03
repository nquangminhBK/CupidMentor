import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SpecialOccasion extends Equatable {
  final Widget image;
  final String title;

  const SpecialOccasion({required this.image, required this.title});

  @override
  List<Object?> get props => [image, title];

  static final List<SpecialOccasion> specialOccasions = [
    SpecialOccasion(image: Assets.png.casualImage.image(), title: 'Casual Dates'),
    SpecialOccasion(image: Assets.png.birthdayImage.image(), title: 'Birthday'),
    SpecialOccasion(image: Assets.png.anniversaryImage.image(), title: 'Anniversary'),
    SpecialOccasion(image: Assets.png.valentineImage.image(), title: 'Valentine'),
    SpecialOccasion(image: Assets.png.christmasImage.image(), title: 'Christmas'),
    SpecialOccasion(image: Assets.png.thanksgivingImage.image(), title: 'Thanksgiving'),
    SpecialOccasion(image: Assets.png.mensDayImage.image(), title: "Men's Day"),
    SpecialOccasion(image: Assets.png.womensDayImages.image(), title: "Women's Day"),
  ];
}
