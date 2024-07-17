import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/core/core_model/content_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class TipsDateSpotDatasource {
  Future<List<ContentResponseModel>> getListTipsDateSpot({required String occasionId});

  Future<bool> addTipsDateSpot({required String occasionId, required ContentResponseModel content});
}

class TipsDateSpotDatasourceImpl implements TipsDateSpotDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const TipsDateSpotDatasourceImpl({required this.firestore, required this.firebaseAuth});

  @override
  Future<bool> addTipsDateSpot({
    required String occasionId,
    required ContentResponseModel content,
  }) async {
    final currentUser = firebaseAuth.currentUser;
    try {
      await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('date_spot_recommendations')
          .collection(occasionId)
          .add(content.toJson());
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ContentResponseModel>> getListTipsDateSpot({required String occasionId}) async {
    final currentUser = firebaseAuth.currentUser;
    try {
      final data = await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('date_spot_recommendations')
          .collection(occasionId)
          .get();
      return data.docs.map((e) => ContentResponseModel.fromJson(e.data())).toList();
    } catch (e) {
      rethrow;
    }
  }
}
