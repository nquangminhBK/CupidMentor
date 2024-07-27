import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/features/auth/data/models/user_info_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationRemoteDatasource {
  Future<User?> signIn();

  Future<User?> webSignIn();

  Future<bool> signOut();

  User? getCurrentUser();

  Future<LoggedInUserInfoModel?> getUserInfo();

  Future<bool> deleteUser();
}

class AuthenticationRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final GoogleAuthProvider googleAuthProvider;
  final FirebaseFirestore firestore;

  const AuthenticationRemoteDatasourceImpl({
    required this.googleSignIn,
    required this.firebaseAuth,
    required this.googleAuthProvider,
    required this.firestore,
  });

  @override
  User? getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  @override
  Future<LoggedInUserInfoModel?> getUserInfo() async {
    final currentUser = getCurrentUser();
    final userId = currentUser?.uid;
    if (userId == null) return null;
    final result = await firestore.collection('users_info').doc(userId).get();
    if (result.data() != null) {
      try {
        return LoggedInUserInfoModel.fromJson(result.data()!);
      } catch (e) {
        debugPrint('[AuthenticationRemoteDatasource] getUserInfo $userId error: $e');
        return null;
      }
    }
    return null;
  }

  @override
  Future<User?> signIn() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      final googleAuth = await googleSignInAccount?.authentication;
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
      final userCredential = await firebaseAuth.signInWithPopup(googleAuthProvider);
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser() async {
    try {
      final currentUser = getCurrentUser();
      final userId = currentUser?.uid;
      if (userId == null) return false;
      await firestore.collection('users_info').doc(userId).delete();
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
