import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

abstract class UISuccess {
  String getDisplayMessage(BuildContext context) {
    return '';
  }
}

class OnboardingSaveInfoSuccess implements UISuccess {
  @override
  String getDisplayMessage(BuildContext context) {
    return context.l10n.updateSuccess;
  }
}
