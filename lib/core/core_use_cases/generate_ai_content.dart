import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final generateAIContentUseCaseProvider = Provider<GenerateAIContent>((ref) {
  return GetIt.I<GenerateAIContent>();
});

class GenerateAIContent implements UseCase<String, GenerateAIContentParam> {
  final GenerativeModel generativeModel;

  const GenerateAIContent({required this.generativeModel});

  @override
  Future<Either<Failure, String>> call(GenerateAIContentParam params) async {
    try {
      final response = await generativeModel.generateContent(params.contents);
      return Right(response.text!);
    } catch (e) {
      debugPrint(e.toString());
      return const Left(Failure('gemini_cannot_generate'));
    }
  }
}

class GenerateAIContentParam {
  final List<Content> contents;

  const GenerateAIContentParam({
    required this.contents,
  });
}
