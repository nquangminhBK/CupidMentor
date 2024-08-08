import 'package:collection/collection.dart';
import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/constants/relationship_type.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_description.dart';
import 'package:cupid_mentor/features/preload_data/domain/entities/content_with_image.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_state.dart';
import 'package:cupid_mentor/features/select_language/presentation/manager/localization_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AIContext {
  final LoggedInUserInfo userInfo;
  final BuildContext context;
  final PreloadDataState preloadData;

  String get userGenderDisplay => userInfo.gender?.displayText.value(context) ?? '';

  List<String> get userPersonalitiesDisplay => userInfo.personalities.map((e) {
        final personality = preloadData.personalities.firstWhereOrNull((p) => p.id == e);
        return personality?.value(context) ?? '';
      }).toList();

  List<String> get userHobbiesDisplay => userInfo.hobbies.map((e) {
        final hobby = preloadData.hobbies.firstWhereOrNull((p) => p.id == e);
        return hobby?.value(context) ?? '';
      }).toList();

  List<String> get userLoveLanguagesDisplay => userInfo.loveLanguages.map((id) {
        final loveLanguage = preloadData.loveLanguages.firstWhereOrNull((e) => e.id == id);
        return loveLanguage?.title.value(context) ?? '';
      }).toList();

  String? get relationshipDisplay =>
      RelationshipType.tryParse(userInfo.relationship)?.displayText.value(context);

  String? get partnerGenderDisplay => userInfo.partnerInfo?.gender?.displayText.value(context);

  List<String>? get partnerHobbiesDisplay => userInfo.partnerInfo?.hobbies.map((e) {
        final hobby = preloadData.hobbies.firstWhereOrNull((p) => p.id == e);
        return hobby?.value(context) ?? '';
      }).toList();

  const AIContext({required this.userInfo, required this.context, required this.preloadData});

  String get _generateAIContext {
    final currentLang = ProviderScope.containerOf(context).read(localizationNotifierProvider).lang;
    switch (currentLang) {
      case LocalizationEnum.english:
        return _generateAIContextEnglish;
      case LocalizationEnum.japanese:
        return _generateAIContextJapanese;
      case LocalizationEnum.vietnamese:
        return _generateAIContextVietnamese;
      default:
        return _generateAIContextEnglish;
    }
  }

  String get _generateAIContextEnglish {
    var result = '';
    final currentAge = DateTime.now().year - (userInfo.birthday.year);
    if (userInfo.name.isNotEmpty) {
      result = "$result I'm ${userInfo.name}";
    }
    if (userInfo.gender != Gender.other && userInfo.gender != null) {
      result = '$result, $userGenderDisplay';
    }
    if (currentAge > 0) {
      result = '$result, $currentAge years old';
    }
    if (userInfo.job.isNotEmpty) {
      result = '$result, and I\'m a ${userInfo.job}';
    }

    if (userInfo.personalities.isNotEmpty) {
      result = '$result. I\'m ';
      for (final personality in userPersonalitiesDisplay) {
        result = '$result $personality,';
      }
    }
    if (userInfo.hobbies.isNotEmpty) {
      result = '$result. My hobbies are ';
      for (final hobby in userHobbiesDisplay) {
        result = '$result $hobby,';
      }
    }
    if (userInfo.loveLanguages.isNotEmpty) {
      result = '$result. My love languages are ';
      for (final loveLang in userLoveLanguagesDisplay) {
        result = '$result $loveLang,';
      }
    }

    if (userInfo.partnerInfo != null) {
      final partnerInfo = userInfo.partnerInfo!;
      if (userInfo.relationship.isNotEmpty) {
        result = '$result. I already had $relationshipDisplay';
      } else {
        result = '$result. I already had a partner';
      }
      if (partnerInfo.name.isNotEmpty) {
        result = '$result. ${userInfo.name}';
      }
      if (partnerInfo.gender != Gender.other && partnerInfo.gender != null) {
        result = '$result, $partnerGenderDisplay';
      }
      if (!partnerInfo.birthday.isSameDate(DateTimeConst.empty())) {
        final partnerAge = DateTime.now().year - (partnerInfo.birthday.year);
        if (partnerAge > 0) {
          result = '$result, $currentAge years old';
        }
      }

      if (partnerInfo.job.isNotEmpty) {
        if (partnerInfo.gender == Gender.male) {
          result = '$result, and he is a ${partnerInfo.job}';
        }

        if (partnerInfo.gender == Gender.female) {
          result = '$result, and she is a ${partnerInfo.job}';
        }
      }

      if (partnerInfo.hobbies.isNotEmpty) {
        if (partnerInfo.gender == Gender.male) {
          result = '$result, and his hobbies are';
        }

        if (partnerInfo.gender == Gender.female) {
          result = '$result, and her hobbies are';
        }
        for (final hobby in partnerHobbiesDisplay ?? []) {
          result = '$result $hobby,';
        }
      }
    }
    return result;
  }

  String get _generateAIContextVietnamese {
    var result = '';
    final currentAge = DateTime.now().year - (userInfo.birthday.year);
    if (userInfo.name.isNotEmpty) {
      result = '$result Tôi là ${userInfo.name}';
    }
    if (userInfo.gender != Gender.other && userInfo.gender != null) {
      result = '$result, $userGenderDisplay';
    }
    if (currentAge > 0) {
      result = '$result, $currentAge tuổi';
    }
    if (userInfo.job.isNotEmpty) {
      result = '$result, và tôi là một ${userInfo.job}';
    }

    if (userInfo.personalities.isNotEmpty) {
      result = '$result. Tôi là một người ';
      for (final personality in userPersonalitiesDisplay) {
        result = '$result $personality,';
      }
    }
    if (userInfo.hobbies.isNotEmpty) {
      result = '$result. Sở thích của tôi là ';
      for (final hobby in userHobbiesDisplay) {
        result = '$result $hobby,';
      }
    }
    if (userInfo.loveLanguages.isNotEmpty) {
      result = '$result. Ngôn ngữ tình yêu của tôi là ';
      for (final loveLang in userLoveLanguagesDisplay) {
        result = '$result $loveLang,';
      }
    }

    if (userInfo.partnerInfo != null) {
      final partnerInfo = userInfo.partnerInfo!;
      if (userInfo.relationship.isNotEmpty) {
        result = '$result. Tôi đã có $relationshipDisplay';
      } else {
        result = '$result. Tôi đã có một người thầm thích';
      }
      if (partnerInfo.name.isNotEmpty) {
        result = '$result. ${partnerInfo.name}';
      }
      if (partnerInfo.gender != Gender.other && partnerInfo.gender != null) {
        result = '$result, $partnerGenderDisplay';
      }
      if (!partnerInfo.birthday.isSameDate(DateTimeConst.empty())) {
        final partnerAge = DateTime.now().year - (partnerInfo.birthday.year);
        if (partnerAge > 0) {
          result = '$result, $partnerAge tuổi';
        }
      }

      if (partnerInfo.job.isNotEmpty) {
        if (partnerInfo.gender == Gender.male) {
          result = '$result, và anh ấy là một ${partnerInfo.job}';
        }

        if (partnerInfo.gender == Gender.female) {
          result = '$result, và cô ấy là một ${partnerInfo.job}';
        }
      }

      if (partnerInfo.hobbies.isNotEmpty) {
        if (partnerInfo.gender == Gender.male) {
          result = '$result, và sở thích của anh ấy là ';
        }

        if (partnerInfo.gender == Gender.female) {
          result = '$result, và sở thích của cô ấy là ';
        }
        for (final hobby in partnerHobbiesDisplay ?? []) {
          result = '$result $hobby,';
        }
      }
    }
    return result;
  }

  String get _generateAIContextJapanese {
    var result = '';
    final currentAge = DateTime.now().year - (userInfo.birthday.year);
    if (userInfo.name.isNotEmpty) {
      result = '$result 私は${userInfo.name}です';
    }
    if (userInfo.gender != Gender.other && userInfo.gender != null) {
      result = '$result, $userGenderDisplay';
    }
    if (currentAge > 0) {
      result = '$result, $currentAge歳です';
    }
    if (userInfo.job.isNotEmpty) {
      result = '$result, そして私は${userInfo.job}です';
    }

    if (userInfo.personalities.isNotEmpty) {
      result = '$result. 私は';
      for (final personality in userPersonalitiesDisplay) {
        result = '$result $personality,';
      }
    }
    if (userInfo.hobbies.isNotEmpty) {
      result = '$result. 趣味は';
      for (final hobby in userHobbiesDisplay) {
        result = '$result $hobby,';
      }
    }
    if (userInfo.loveLanguages.isNotEmpty) {
      result = '$result. 愛の言語は';
      for (final loveLang in userLoveLanguagesDisplay) {
        result = '$result $loveLang,';
      }
    }

    if (userInfo.partnerInfo != null) {
      final partnerInfo = userInfo.partnerInfo!;
      if (userInfo.relationship.isNotEmpty) {
        result = '$result. 私は既に${userInfo.relationship}がありました';
      } else {
        result = '$result. 私は既に片思いがありました';
      }
      if (partnerInfo.name.isNotEmpty) {
        result = '$result. ${partnerInfo.name}';
      }
      if (partnerInfo.gender != Gender.other && partnerInfo.gender != null) {
        result = '$result, $partnerGenderDisplay';
      }
      if (!partnerInfo.birthday.isSameDate(DateTimeConst.empty())) {
        final partnerAge = DateTime.now().year - (partnerInfo.birthday.year);
        if (partnerAge > 0) {
          result = '$result, $partnerAge歳です';
        }
      }

      if (partnerInfo.job.isNotEmpty) {
        if (partnerInfo.gender == Gender.male) {
          result = '$result, そして彼は${partnerInfo.job}です';
        }

        if (partnerInfo.gender == Gender.female) {
          result = '$result, そして彼女は${partnerInfo.job}です';
        }
      }

      if (partnerInfo.hobbies.isNotEmpty) {
        if (partnerInfo.gender == Gender.male) {
          result = '$result, そして彼の趣味は';
        }

        if (partnerInfo.gender == Gender.female) {
          result = '$result, そして彼女の趣味は';
        }
        for (final hobby in partnerHobbiesDisplay ?? []) {
          result = '$result $hobby,';
        }
      }
    }
    return result;
  }

  String tipsGiftCommand(ContentWithImage occasion) {
    final relationship =
        (RelationshipType.tryParse(userInfo.relationship) ?? RelationshipType.crush)
            .displayText
            .value(context);
    final currentLang = ProviderScope.containerOf(context).read(localizationNotifierProvider).lang;
    switch (currentLang) {
      case LocalizationEnum.english:
        return '$_generateAIContext. Please give me gift suggestions for my $relationship on the occasion of ${occasion.title.value(context)}. Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
      case LocalizationEnum.japanese:
        return '$_generateAIContext. 私の$relationshipにお勧めの贈り物を、${occasion.title.value(context)}のお祝いの際に教えてください。具体的で詳細なフィードバックを提供してください。情報が不十分な場合は、異なるシナリオに合わせた提案をしてください。ナンセンスなことを言わないでください';
      case LocalizationEnum.vietnamese:
        return '$_generateAIContext. Hãy cho tôi gợi ý chọn quà tặng cho $relationship của tôi vào dịp ${occasion.title.value(context)}. Vui lòng cung cấp phản hồi cụ thể và chi tiết. Nếu thông tin chưa đủ, hãy đưa ra các gợi ý phù hợp với các tình huống khác nhau. Không nói tào lao.';
      default:
        return '$_generateAIContext. Please give me gift suggestions for my $relationship on the occasion of ${occasion.title.value(context)}. Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
    }
  }

  String tipsDateSpotCommand(ContentWithImage occasion) {
    final currentLang = ProviderScope.containerOf(context).read(localizationNotifierProvider).lang;
    switch (currentLang) {
      case LocalizationEnum.english:
        return '$_generateAIContext. Please give me suggestions for a dating location to celebrate the ${occasion.title.value(context)}. Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
      case LocalizationEnum.japanese:
        return '$_generateAIContext. ${occasion.title.value(context)}のデートスポットの提案を教えてください。具体的で詳細なフィードバックを提供してください。情報が不十分な場合は、異なるシナリオに合わせた提案をしてください。ナンセンスなことを言わないでください';
      case LocalizationEnum.vietnamese:
        return '$_generateAIContext. Hãy cho tôi gợi ý về địa điểm hẹn hò vào dịp ${occasion.title.value(context)}. Vui lòng cung cấp phản hồi cụ thể và chi tiết. Nếu thông tin chưa đủ, hãy đưa ra các gợi ý phù hợp với các tình huống khác nhau. Không nói tào lao.';
      default:
        return '$_generateAIContext. Please give me suggestions for a dating location to celebrate the ${occasion.title.value(context)}. Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
    }
  }

  String tipsSelfImprovement(ContentWithDescription tips) {
    final currentLang = ProviderScope.containerOf(context).read(localizationNotifierProvider).lang;
    switch (currentLang) {
      case LocalizationEnum.english:
        return '$_generateAIContext. With these info. Let give me the best response about: ${tips.title.value(context)}. Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
      case LocalizationEnum.japanese:
        return '$_generateAIContext. この情報を元に、${tips.title.value(context)} について最良のフィードバックをください。具体的で詳細なフィードバックを提供してください。情報が不十分な場合は、異なるシナリオに合わせた提案をしてください。ナンセンスなことを言わないでください';
      case LocalizationEnum.vietnamese:
        return '$_generateAIContext. Với những thông tin này, hãy cho tôi phản hồi tốt nhất về: ${tips.title.value(context)}. Vui lòng cung cấp phản hồi cụ thể và chi tiết. Nếu thông tin chưa đủ, hãy đưa ra các gợi ý phù hợp với các tình huống khác nhau. Không nói tào lao.';
      default:
        return '$_generateAIContext. With these info. Let give me the best response about: ${tips.title.value(context)}. Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
    }
  }

  String tipsReplying(String message) {
    final currentLang = ProviderScope.containerOf(context).read(localizationNotifierProvider).lang;
    switch (currentLang) {
      case LocalizationEnum.english:
        return '$_generateAIContext. With this information, please help me think of a way to reply when my special someone texts me: "$message". Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
      case LocalizationEnum.japanese:
        return '$_generateAIContext. これらの情報を基に、彼女が「$message」とメッセージを送ってきたときの返信方法を考えるのを手伝ってください。。具体的で詳細なフィードバックを提供してください。情報が不十分な場合は、異なるシナリオに合わせた提案をしてください。ナンセンスなことを言わないでください';
      case LocalizationEnum.vietnamese:
        return '$_generateAIContext. hãy giúp tôi nghĩ về cách trả lời tin nhắn khi người ấy của tôi nhắn tin rằng: "$message". Vui lòng cung cấp phản hồi cụ thể và chi tiết. Nếu thông tin chưa đủ, hãy đưa ra các gợi ý phù hợp với các tình huống khác nhau. Không nói tào lao.';
      default:
        return '$_generateAIContext. With this information, please help me think of a way to reply when my special someone texts me: "$message". Please provide specific and detailed feedback. If the information is insufficient, offer suggestions tailored to different scenarios. No crap';
    }
  }
}
