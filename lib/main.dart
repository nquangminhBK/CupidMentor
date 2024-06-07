import 'package:cupid_mentor/core/constants/gemini_api_key.dart';
import 'package:cupid_mentor/di.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App.init());
}
Future<void >initializeConfigs() async {
  await setupLocator();
}