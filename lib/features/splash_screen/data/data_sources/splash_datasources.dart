import 'package:shared_preferences/shared_preferences.dart';

const firstTimeKey = "firstTime";

abstract class SplashDatasource {
  bool isFirstTime();

  bool updateFirstTime();
}

class SplashDatasourceImpl implements SplashDatasource {
  final SharedPreferences sharedPreferences;

  const SplashDatasourceImpl({required this.sharedPreferences});

  @override
  bool isFirstTime() {
    bool? isFirstTime = sharedPreferences.getBool(firstTimeKey);
    return isFirstTime ?? true;
  }

  @override
  bool updateFirstTime() {
    sharedPreferences.setBool(firstTimeKey, false);
    return true;
  }
}
