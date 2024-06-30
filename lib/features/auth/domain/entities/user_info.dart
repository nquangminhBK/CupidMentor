import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:equatable/equatable.dart';

class LoggedInUserInfo extends Equatable {
  final Gender gender;
  final String name;
  final String avatar;
  final DateTime birthday;
  final String job;
  final List<String> personalities;
  final List<String> hobbies;
  final List<String> loveLanguages;

  const LoggedInUserInfo(
      {required this.gender,
      required this.name,
      required this.avatar,
      required this.birthday,
      required this.job,
      required this.personalities,
      required this.hobbies,
      required this.loveLanguages});

  @override
  List<Object?> get props =>
      [gender, name, birthday, job, avatar, personalities, hobbies, loveLanguages];
}
