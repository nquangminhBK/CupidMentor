import 'package:cupid_mentor/core/widgets/loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtil {
  static void configLoading() {
    EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 2000)
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 50.0
    // ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.transparent
      ..indicatorColor = const Color(0xFFFFFFFF)
      ..textColor = Colors.yellow
      ..maskColor = Colors.black.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static void showLoading({String? message}) {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.custom,
      indicator: LoadingAnimation(
        message: message,
      ),
    );
  }

  static void hideLoading() {
    EasyLoading.dismiss(animation: true);
  }
}
