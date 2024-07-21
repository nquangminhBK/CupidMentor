import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/core/constants/paging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class TipsReplyingDatasource {
  Future<List<types.Message>> getMessages({
    required String lastMsgId,
  });

  Future<bool> addMessage({
    required types.Message message,
  });

  Future<bool> deleteConversation();
}

class TipsReplyingDatasourceImpl implements TipsReplyingDatasource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  const TipsReplyingDatasourceImpl({required this.firestore, required this.firebaseAuth});

  @override
  Future<bool> addMessage({required types.Message message}) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('replying_recommendations')
          .collection('messages')
          .doc(message.id)
          .set(message.toJson());
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<types.Message>> getMessages({required String lastMsgId}) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (lastMsgId.isEmpty) {
        final data = await firestore
            .collection('users_info')
            .doc(currentUser!.uid)
            .collection('ai_suggestions')
            .doc('replying_recommendations')
            .collection('messages')
            .orderBy('createdAt', descending: true)
            .limit(Paging.pageSize)
            .get();
        final result = data.docs.map((e) => types.Message.fromJson(e.data())).toList();
        result.sort((a, b) => (b.createdAt ?? 0).compareTo(a.createdAt ?? 0));
        return result;
      }
      final lastDoc = await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('replying_recommendations')
          .collection('messages')
          .doc(lastMsgId)
          .get();
      final data = await firestore
          .collection('users_info')
          .doc(currentUser.uid)
          .collection('ai_suggestions')
          .doc('replying_recommendations')
          .collection('messages')
          .orderBy('createdAt', descending: true)
          .startAfterDocument(lastDoc)
          .limit(Paging.pageSize)
          .get();
      final result = data.docs.map((e) => types.Message.fromJson(e.data())).toList();
      result.sort((a, b) => (b.createdAt ?? 0).compareTo(a.createdAt ?? 0));
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteConversation() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      await firestore
          .collection('users_info')
          .doc(currentUser!.uid)
          .collection('ai_suggestions')
          .doc('replying_recommendations')
          .collection('messages')
          .get()
          .then((snapshot) {
        for (final doc in snapshot.docs) {
          doc.reference.delete();
        }
      });
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
