import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/features/auth/domain/entities/crush_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationRemoteDatasource {
  Future<User?> signIn();

  Future<User?> webSignIn();

  Future<bool> signOut();

  User? getCurrentUser();

  Future<UserInfo> getUserInfo(String userId);

  Future<CrushInfo> getCrushInfo();
}

class AuthenticationRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final GoogleAuthProvider googleAuthProvider;
  final FirebaseFirestore firestore;

  const AuthenticationRemoteDatasourceImpl(
      {required this.googleSignIn,
      required this.firebaseAuth,
      required this.googleAuthProvider,
      required this.firestore});

  @override
  Future<CrushInfo> getCrushInfo() {
    // TODO: implement getCrushInfo
    throw UnimplementedError();
  }

  @override
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Future<UserInfo> getUserInfo(String userId) async {
    // final result = await firestore.collection("listUsers").doc(userId).get();
    // if (result.data() != null) {
    //   return UserInfoData.fromJson(result.data());
    // }
    // return null;
    throw UnimplementedError();
  }

  @override
  Future<User?> signIn() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleSignInAccount?.authentication;
      if (googleAuth == null) return null;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
    return true;
  }

  @override
  Future<User?> webSignIn() async {
    try {
      final UserCredential userCredential = await firebaseAuth.signInWithPopup(googleAuthProvider);
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }
}
