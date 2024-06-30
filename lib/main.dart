import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/di.dart';
import 'package:cupid_mentor/firebase_options/prod_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoadingUtil.configLoading();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeConfigs();

  runApp(ProviderScope(
    child: App.init(),
  ));
}

Future<void> initializeConfigs() async {
  await setupLocator();
}
