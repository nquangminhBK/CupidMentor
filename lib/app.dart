import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/route_generator.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/themes_colors/themes.dart';
import 'package:cupid_mentor/core/themes_colors/themes_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
