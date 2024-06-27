import 'package:equatable/equatable.dart';

class SelfImprovement extends Equatable {
  final String title;
  final String description;

  const SelfImprovement({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];

  static final List<SelfImprovement> selfImprovements = [
    SelfImprovement(
        title: "10 Secrets to Becoming the Perfect Partner in Your Relationship", description: ""),
    SelfImprovement(title: "How to enhance your appearance to be more attractive", description: ""),
    SelfImprovement(
        title: "Ways to Strike Up a Cool Conversation with Your Crush", description: ""),
    SelfImprovement(
        title: "How to create a more attractive bio/profile on social media and dating apps",
        description: ""),
  ];
}
