import 'dart:convert';

import 'package:cupid_mentor/core/remote_config/default_value.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig remoteConfig;

  const RemoteConfigService(this.remoteConfig);

  Future initialize() async {
    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(hours: 6),
        ),
      );

    await remoteConfig.setDefaults(<String, dynamic>{
      'aboutUs': jsonEncode(DefaultValue.aboutUs),
      'hobbies': jsonEncode(DefaultValue.hobbies),
      'loveLanguageConcepts': jsonEncode(DefaultValue.loveLanguageConcepts),
      'loveLanguageOverallInfo': jsonEncode(DefaultValue.loveLanguageOverallInfo),
      'loveLanguages': jsonEncode(DefaultValue.loveLanguages),
      'personalities': jsonEncode(DefaultValue.personalities),
      'privacyPolicy': jsonEncode(DefaultValue.privacyPolicy),
      'selfImprovements': jsonEncode(DefaultValue.selfImprovements),
      'specialOccasions': jsonEncode(DefaultValue.specialOccasions),
      'termOfService': jsonEncode(DefaultValue.termOfService),
    });
    await remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint('Remote config fetch throttled: $e');
    }
  }
}
