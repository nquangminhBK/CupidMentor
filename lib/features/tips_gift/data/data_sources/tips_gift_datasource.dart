import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/core/core_model/content_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class TipsGiftDatasource {
  Future<List<ContentResponseModel>> getListTipsGift({required String occasionId});

  Future<bool> deleteTipGift({required String occasionId, required String contentId});

  Future<bool> addTipsGift({required String occasionId, required ContentResponseModel content});
}

class TipsGiftDatasourceImpl implements TipsGiftDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const TipsGiftDatasourceImpl({required this.firestore, required this.firebaseAuth});

  @override
  Future<bool> addTipsGift({
    required String occasionId,
    required ContentResponseModel content,
  }) async {
    final currentUser = firebaseAuth.currentUser;
    try {
      await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('gift_recommendations')
          .collection(occasionId)
          .doc(content.id)
          .set(content.toJson());
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ContentResponseModel>> getListTipsGift({required String occasionId}) async {
    final currentUser = firebaseAuth.currentUser;
    try {
      final data = await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('gift_recommendations')
          .collection(occasionId)
          .get();
      return data.docs.map((e) => ContentResponseModel.fromJson(e.data())).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteTipGift({
    required String occasionId,
    required String contentId,
  }) async {
    final currentUser = firebaseAuth.currentUser;
    await firestore
        .collection('users_info')
        .doc(currentUser!.uid)
        .collection('ai_suggestions')
        .doc('gift_recommendations')
        .collection(occasionId)
        .doc(contentId)
        .delete();
    return true;
  }
}
