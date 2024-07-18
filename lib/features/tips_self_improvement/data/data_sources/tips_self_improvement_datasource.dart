import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/core/core_model/content_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class TipsSelfImprovementDatasource {
  Future<List<ContentResponseModel>> getListTipsSelfImprovement({
    required String selfImprovementId,
  });

  Future<bool> addTipsSelfImprovement({
    required String selfImprovementId,
    required ContentResponseModel content,
  });
}

class TipsSelfImprovementDatasourceImpl implements TipsSelfImprovementDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const TipsSelfImprovementDatasourceImpl({required this.firestore, required this.firebaseAuth});

  @override
  Future<bool> addTipsSelfImprovement({
    required String selfImprovementId,
    required ContentResponseModel content,
  }) async {
    final currentUser = firebaseAuth.currentUser;
    try {
      await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('self_improvement_recommendations')
          .collection(selfImprovementId)
          .add(content.toJson());
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ContentResponseModel>> getListTipsSelfImprovement({
    required String selfImprovementId,
  }) async {
    final currentUser = firebaseAuth.currentUser;
    try {
      final data = await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('self_improvement_recommendations')
          .collection(selfImprovementId)
          .get();
      return data.docs.map((e) => ContentResponseModel.fromJson(e.data())).toList();
    } catch (e) {
      rethrow;
    }
  }
}