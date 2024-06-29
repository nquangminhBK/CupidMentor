import 'package:cupid_mentor/core/constants/gender.dart';
import 'package:equatable/equatable.dart';

class Crush extends Equatable {
  final Gender gender;
  final String name;
  final DateTime birthday;
  final String job;
  final List<String> hobbies;

  const Crush({
    required this.gender,
    required this.name,
    required this.birthday,
    required this.job,
    required this.hobbies,
  });

  @override
  List<Object?> get props => [gender, name, birthday, job, hobbies];
}
