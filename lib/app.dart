import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/route_generator.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/themes_colors/themes.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:cupid_mentor/features/localization/presentation/manager/localization_notifier.dart';
import 'package:cupid_mentor/features/preload_data/presentation/manager/preload_data_notifier.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  static Widget init() => const ProviderScope(child: App());

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  void initState() {
    ref.read(themeNotifierProvider.notifier).checkInitialTheme();
    ref.read(preloadDataNotifierProvider.notifier).initializeAndFetchRemoteConfig();
    ref.read(localizationNotifierProvider.notifier).checkInitialLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = ref.watch(localizationNotifierProvider).lang;
    return MaterialApp(
      title: 'Cupid Mentor',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.globalNavigatorKey,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ref.watch(themeNotifierProvider).currentTheme,
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.splash,
      builder: (context, myWidget) {
        myWidget = EasyLoading.init()(context, myWidget);
        return myWidget;
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale(LocalizationEnum.english.value), // English
        Locale(LocalizationEnum.japanese.value),
        Locale(LocalizationEnum.vietnamese.value), // Spanish
      ],
      locale: Locale.fromSubtags(languageCode: currentLocale.value),
    );
  }
}
