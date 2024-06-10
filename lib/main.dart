import 'package:cupid_mentor/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeConfigs();

  runApp(ProviderScope(
    child: App.init(),
  ));
}

Future<void> initializeConfigs() async {
  await setupLocator();
}
