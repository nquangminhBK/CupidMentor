import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt get = GetIt.instance;

Future<void> setupLocator() async {
  get.registerLazySingletonAsync<SharedPreferences>(()  {
    final instance =  SharedPreferences.getInstance();
    return instance;
  });

  await get.isReady<SharedPreferences>();
}
