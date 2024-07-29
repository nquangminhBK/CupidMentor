import 'package:cupid_mentor/core/themes_colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_fonts/google_fonts.dart';

final cupidMentorDarkColor = DarkChatTheme(
  backgroundColor: AppColors.dark.screenBackgroundColor,
  inputBackgroundColor: AppColors.dark.buttonBackgroundColor,
  inputTextCursorColor: AppColors.dark.textColor,
  inputTextColor: AppColors.dark.textColor,
  primaryColor: AppColors.dark.primaryColor,
  secondaryColor: AppColors.dark.secondaryColor.withOpacity(0.1),
  sentMessageBodyTextStyle:
      GoogleFonts.manrope(fontWeight: FontWeight.w500, color: AppColors.dark.textColor),
);
final cupidMentorLightColor = DefaultChatTheme(
  backgroundColor: AppColors.light.screenBackgroundColor,
  inputBackgroundColor: AppColors.light.buttonBackgroundColor,
  inputTextCursorColor: AppColors.light.textColor,
  inputTextColor: AppColors.light.textColor,
  primaryColor: AppColors.light.primaryColor.withOpacity(0.1),
  secondaryColor: AppColors.dark.secondaryColor.withOpacity(0.1),
  sentMessageBodyTextStyle:
      GoogleFonts.manrope(fontWeight: FontWeight.w500, color: AppColors.light.textColor),
);
