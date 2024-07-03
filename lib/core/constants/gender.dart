import 'package:collection/collection.dart';

enum Gender {
  male('Male'),
  female('Female'),
  other('Other'),
  none('none');

  final String value;

  const Gender(this.value);

  static Gender? tryParse(String value) => Gender.values.firstWhereOrNull(
        (element) => element.value.toLowerCase() == value.toLowerCase(),
      );

  static List<Gender> genders() => [Gender.male, Gender.female, Gender.other];
}
