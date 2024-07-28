import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';

abstract class UIError {
  String getDisplayMessage(BuildContext context) {
    return '';
  }
}

class OnboardingMissingNameError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingNameError;
  }
}

class OnboardingMissingGenderError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingGenderError;
  }
}

class OnboardingMissingBirthdayError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingBirthdayError;
  }
}

class OnboardingMissingJobError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingJobError;
  }
}

class OnboardingMissingPersonalitiesError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingPersonalitiesError;
  }
}

class OnboardingMissingHobbiesError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingHobbiesError;
  }
}

class OnboardingMissingLoveLanguageError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingLoveLanguagesError;
  }
}

class OnboardingMissingRelationshipTypeError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingRelationshipTypeError;
  }
}

class OnboardingMissingPartnerGenderError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.onboardingMissingPartnerGenderError;
  }
}

class GetUserInformationFailedError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.getUserInfoFailedMsg;
  }
}

class OnboardingSaveInfoFailedError implements UIError {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.saveInfoFailedMsg;
  }
}
