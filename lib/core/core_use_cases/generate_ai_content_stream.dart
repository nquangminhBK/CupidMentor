import 'package:cupid_mentor/core/errors/api_failure.dart';
import 'package:cupid_mentor/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final generateAIContentStreamUseCaseProvider = Provider<GenerateAIContentStream>((ref) {
  return GetIt.I<GenerateAIContentStream>();
});

class GenerateAIContentStream
    implements UseCase<Stream<GenerateContentResponse>, GenerateAIContentStreamParam> {
  final GenerativeModel generativeModel;

  const GenerateAIContentStream({required this.generativeModel});

  @override
  Future<Either<Failure, Stream<GenerateContentResponse>>> call(
    GenerateAIContentStreamParam params,
  ) async {
    try {
      final response = generativeModel.generateContentStream(params.contents);
      return Right(response);
    } catch (e) {
      debugPrint(e.toString());
      return const Left(Failure('gemini_cannot_generate'));
    }
  }
}

class GenerateAIContentStreamParam {
  final List<Content> contents;

  const GenerateAIContentStreamParam({
    required this.contents,
  });
}
