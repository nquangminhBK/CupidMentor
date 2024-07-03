import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/features/auth/data/models/user_info_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class OnboardingDatasource {
  Future<bool> saveUserInfo(String userId, LoggedInUserInfoModel userInfoModel);
}

class OnboardingDatasourceImpl implements OnboardingDatasource {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final GoogleAuthProvider googleAuthProvider;
  final FirebaseFirestore firestore;

  const OnboardingDatasourceImpl({
    required this.googleSignIn,
    required this.firebaseAuth,
    required this.googleAuthProvider,
    required this.firestore,
  });

  @override
  Future<bool> saveUserInfo(String userId, LoggedInUserInfoModel userInfoModel) async {
    try {
      await firestore.collection('users_info').doc(userId).set(userInfoModel.toJson());
      return true;
    } catch (_) {
      rethrow;
    }
  }
}
