import 'dart:convert';

import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:cupid_mentor/core/remote_config/remote_config.dart';
import 'package:cupid_mentor/features/preload_data/data/models/content_with_description_model.dart';
import 'package:cupid_mentor/features/preload_data/data/models/content_with_image_model.dart';
import 'package:cupid_mentor/features/preload_data/data/models/self_improvement_model.dart';

abstract class PreloadDatasource {
  Future<List<LocalizationContent>> getHobbies();

  Future<List<LocalizationContent>> getPersonalities();

  Future<LocalizationContent> getLoveLanguagesConcepts();

  Future<LocalizationContent> getLoveLanguagesOverallInfo();

  Future<List<ContentWithDescriptionModel>> getLoveLanguages();

  Future<LocalizationContent> getAboutUs();

  Future<LocalizationContent> getTermOfService();

  Future<LocalizationContent> getPrivacyPolicy();

  Future<List<SelfImprovementModel>> getSelfImprovements();

  Future<List<ContentWithImageModel>> getSpecialOccasions();

  Future<void> initialize();
}

class PreloadDatasourceImpl implements PreloadDatasource {
  final RemoteConfigService remoteConfig;

  const PreloadDatasourceImpl({required this.remoteConfig});

  @override
  Future<LocalizationContent> getAboutUs() async {
    try {
      final result = remoteConfig.remoteConfig.getString('aboutUs').toString();
      return LocalizationContent.fromJson(jsonDecode(result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<LocalizationContent>> getHobbies() async {
    try {
      final jsonList =
          List<dynamic>.from(jsonDecode(remoteConfig.remoteConfig.getString('hobbies')));
      return jsonList.map((item) => LocalizationContent.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LocalizationContent> getLoveLanguagesConcepts() async {
    try {
      final result = remoteConfig.remoteConfig.getString('loveLanguageConcepts').toString();
      return LocalizationContent.fromJson(jsonDecode(result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LocalizationContent> getLoveLanguagesOverallInfo() async {
    try {
      final result = remoteConfig.remoteConfig.getString('loveLanguageOverallInfo').toString();
      return LocalizationContent.fromJson(jsonDecode(result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<LocalizationContent>> getPersonalities() async {
    try {
      final jsonList =
          List<dynamic>.from(jsonDecode(remoteConfig.remoteConfig.getString('personalities')));
      return jsonList.map((item) => LocalizationContent.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LocalizationContent> getPrivacyPolicy() async {
    try {
      final result = remoteConfig.remoteConfig.getString('privacyPolicy').toString();
      return LocalizationContent.fromJson(jsonDecode(result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SelfImprovementModel>> getSelfImprovements() async {
    try {
      final jsonList =
          List<dynamic>.from(jsonDecode(remoteConfig.remoteConfig.getString('selfImprovements')));
      return jsonList.map((item) => SelfImprovementModel.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ContentWithImageModel>> getSpecialOccasions() async {
    try {
      final jsonList =
          List<dynamic>.from(jsonDecode(remoteConfig.remoteConfig.getString('specialOccasions')));
      return jsonList.map((item) => ContentWithImageModel.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LocalizationContent> getTermOfService() async {
    try {
      final result = remoteConfig.remoteConfig.getString('termOfService').toString();
      return LocalizationContent.fromJson(jsonDecode(result));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ContentWithDescriptionModel>> getLoveLanguages() async {
    try {
      final jsonList =
          List<dynamic>.from(jsonDecode(remoteConfig.remoteConfig.getString('loveLanguages')));
      return jsonList.map((item) => ContentWithDescriptionModel.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> initialize() async {
    await remoteConfig.initialize();
  }
}
