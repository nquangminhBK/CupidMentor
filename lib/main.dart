import 'package:cupid_mentor/app.dart';
import 'package:cupid_mentor/core/utils/loading_utils.dart';
import 'package:cupid_mentor/core/widgets/reset_all_app.dart';
import 'package:cupid_mentor/di.dart';
import 'package:cupid_mentor/firebase_options/prod_firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LoadingUtils.configLoading();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeConfigs();

  runApp(
    ResetAllApp(child: App.init()),
  );
}

Future<void> initializeConfigs() async {
  await setupLocator();
}
