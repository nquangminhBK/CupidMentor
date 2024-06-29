import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/extensions/context_extensions.dart';
import 'package:cupid_mentor/core/extensions/widget_ref_extensions.dart';
import 'package:cupid_mentor/core/navigation/navigation_service.dart';
import 'package:cupid_mentor/core/navigation/routes.dart';
import 'package:cupid_mentor/core/widgets/animated_button.dart';
import 'package:cupid_mentor/core/widgets/horizontal_space.dart';
import 'package:cupid_mentor/core/widgets/vertical_space.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

const String clientID = "127251596810-gogifgivib0mm4b64itugcji2quf4bu2.apps.googleusercontent.com";

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Assets.png.datingDelightImage.image())),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Hi there, Welcome to Cupid mentor, To start your journey, let's",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyLarge!
                            .copyWith(color: ref.currentAppColor.textColor),
                      )),
                  const VerticalSpace(size: 20),
                  AnimatedButton(
                      onPress: () async {
                        print("minh check 1 ${FirebaseAuth.instance.currentUser}");
                        if (FirebaseAuth.instance.currentUser == null) {
                          if (kIsWeb) {
                            GoogleAuthProvider authProvider = GoogleAuthProvider();
                            final UserCredential userCredential =
                                await FirebaseAuth.instance.signInWithPopup(authProvider);
                            final user = userCredential.user;
                            print("minh check $userCredential");
                          } else {
                            GoogleSignIn().signIn().then((googleUser) async {
                              final GoogleSignInAuthentication? googleAuth =
                                  await googleUser?.authentication;
                              if (googleAuth != null) {
                                final credential = GoogleAuthProvider.credential(
                                  accessToken: googleAuth?.accessToken,
                                  idToken: googleAuth?.idToken,
                                );
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential)
                                    .then((userCredential) async {
                                  print("minh check 2 ${userCredential.user}");
                                });
                              }
                            });
                          }
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ref.currentAppColor.buttonBackgroundColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.svg.googleIcon.svg(),
                              const HorizontalSpace(size: 12),
                              Text(
                                "Continue with Google",
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium!
                                    .copyWith(color: ref.currentAppColor.textColor),
                              ),
                            ],
                          ))),
                  const VerticalSpace(size: 20),
                  AnimatedButton(
                      onPress: () {},
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ref.currentAppColor.buttonBackgroundColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.svg.appleIcon.svg(),
                              const HorizontalSpace(size: 12),
                              Text(
                                "Continue with Apple",
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium!
                                    .copyWith(color: ref.currentAppColor.textColor),
                              ),
                            ],
                          ))),
                  const VerticalSpace(size: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "By logging in, you agree to our Terms of Conditions. LEarn how we use your data in our Privacy Policy",
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge!
                          .copyWith(color: ref.currentAppColor.textColor),
                    ),
                  ),
                  const VerticalSpace(size: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
