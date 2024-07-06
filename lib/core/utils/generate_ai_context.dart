import 'package:cupid_mentor/core/constants/datetime.dart';
import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:cupid_mentor/core/extensions/datetime_extension.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:flutter/material.dart';

class AIContext {
  static String generateAIContext(LoggedInUserInfo userInfo) {
    var result = '';
    final currentAge = DateTime.now().year - (userInfo.birthday.year);
    if (userInfo.name.isNotEmpty) {
      result = "$result I'm ${userInfo.name}";
    }
    if (userInfo.gender != Gender.other) {
      result = '$result, ${userInfo.gender.value}';
    }
    if (currentAge > 0) {
      result = '$result, $currentAge years old';
    }
    if (userInfo.job.isNotEmpty) {
      result = '$result, and I\'m a ${userInfo.job}';
    }

    if (userInfo.personalities.isNotEmpty) {
      result = '$result. I\'m ';
      for (final personality in userInfo.personalities) {
        result = '$result $personality,';
      }
    }
    if (userInfo.hobbies.isNotEmpty) {
      result = '$result. My hobbies are ';
      for (final hobby in userInfo.hobbies) {
        result = '$result $hobby,';
      }
    }
    if (userInfo.loveLanguages.isNotEmpty) {
      result = '$result. My love languages are ';
      for (final loveLang in userInfo.hobbies) {
        result = '$result $loveLang,';
      }
    }

    if (userInfo.crushInfo != null) {
      final crushInfo = userInfo.crushInfo!;
      if (userInfo.crushType.isNotEmpty) {
        result = '$result. I already had ${userInfo.crushType}';
      } else {
        result = '$result. I already had a crush';
      }
      if (crushInfo.name.isNotEmpty) {
        result = '$result. ${userInfo.name}';
      }
      if (crushInfo.gender != Gender.other) {
        result = '$result, ${crushInfo.gender.value}';
      }
      if (!crushInfo.birthday.isSameDate(DateTimeConst.empty())) {
        final crushAge = DateTime.now().year - (crushInfo.birthday.year);
        if (crushAge > 0) {
          result = '$result, $currentAge years old';
        }
      }

      if (crushInfo.job.isNotEmpty) {
        if (crushInfo.gender == Gender.male) {
          result = '$result, and he is a ${crushInfo.job}';
        }

        if (crushInfo.gender == Gender.female) {
          result = '$result, and she is a ${crushInfo.job}';
        }
      }

      if (crushInfo.hobbies.isNotEmpty) {
        if (crushInfo.gender == Gender.male) {
          result = '$result, and his hobbies are';
        }

        if (crushInfo.gender == Gender.female) {
          result = '$result, and her hobbies are';
        }
        for (final hobby in userInfo.hobbies) {
          result = '$result $hobby,';
        }
      }
    }
    result = '$result. With these info. Let give me the best response about';
    debugPrint("minh check $result");
    return result;
  }
}
