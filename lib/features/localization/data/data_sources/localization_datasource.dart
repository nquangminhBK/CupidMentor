import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String localizationDBKey = 'localization';

abstract class LocalizationDatasource {
  Future<LocalizationEnum> getLanguage();

  Future<bool> setLanguage(LocalizationEnum language);

  Future<bool> clearLanguageData();
}

class LocalizationDatasourceImpl implements LocalizationDatasource {
  final SharedPreferences sharedPreferences;

  const LocalizationDatasourceImpl({required this.sharedPreferences});

  @override
  Future<LocalizationEnum> getLanguage() async {
    final value = sharedPreferences.getString(localizationDBKey);
    return LocalizationEnum.parse(value ?? '');
  }

  @override
  Future<bool> setLanguage(LocalizationEnum language) async {
    return await sharedPreferences.setString(localizationDBKey, language.value);
  }

  @override
  Future<bool> clearLanguageData() async {
    return await sharedPreferences.remove(localizationDBKey);
  }
}
