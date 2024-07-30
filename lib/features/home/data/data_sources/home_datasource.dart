import 'package:shared_preferences/shared_preferences.dart';

const needShowIntroductionKey = 'needShowIntroductionKey';

abstract class HomeDatasource {
  bool needShowIntroduction();

  bool updateNeedShowIntroduction();
}

class HomeDatasourceImpl implements HomeDatasource {
  final SharedPreferences sharedPreferences;

  const HomeDatasourceImpl({required this.sharedPreferences});

  @override
  bool needShowIntroduction() {
    final needShowIntroduction = sharedPreferences.getBool(needShowIntroductionKey);
    return needShowIntroduction ?? true;
  }

  @override
  bool updateNeedShowIntroduction() {
    sharedPreferences.setBool(needShowIntroductionKey, false);
    return true;
  }
}
