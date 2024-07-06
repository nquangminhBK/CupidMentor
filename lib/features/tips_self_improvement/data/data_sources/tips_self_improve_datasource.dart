import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_mentor/core/utils/generate_ai_context.dart';
import 'package:cupid_mentor/features/auth/data/models/user_info_model.dart';
import 'package:cupid_mentor/features/auth/domain/entities/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class TipsSelfImproveDatasource {
  Future<String?> generateResponseTipsSelfImprove({
    required String content,
    required LoggedInUserInfo userInfo,
  });
}

class TipsSelfImproveDatasourceImpl implements TipsSelfImproveDatasource {
  final GenerativeModel generativeModel;

  const TipsSelfImproveDatasourceImpl({required this.generativeModel});

  @override
  Future<String?> generateResponseTipsSelfImprove({
    required String content,
    required LoggedInUserInfo userInfo,
  }) async {
    final prompt = '私はグエン・クアン・ミン、男性です。私は大丈夫です。私は自信があり、気楽な性格です。趣味はバスケットボールとビデオゲームです。私の愛の言語もバスケットボールとビデオゲームです。すでに友達（女性）がいます。これらの情報をもとに、私に最適な反応を教えてください。ソーシャルメディアでより魅力的な自己紹介を作成する方法';
    final aiContent = [Content.text(prompt)];
    final response = await generativeModel.generateContent(aiContent);
    return response.text;
  }
}
