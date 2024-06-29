import 'package:equatable/equatable.dart';

class SelfImprovement extends Equatable {
  final String title;
  final String description;

  const SelfImprovement({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];

  static const List<SelfImprovement> selfImprovements = [
    SelfImprovement(
        title: "10 Secrets to Becoming the Perfect Partner in Your Relationship", description: ""),
    SelfImprovement(title: "How to enhance your appearance to be more attractive", description: ""),
    SelfImprovement(
        title: "Ways to Strike Up a Cool Conversation with Your Crush", description: ""),
    SelfImprovement(
        title: "How to create a more attractive bio/profile on social media and dating apps",
        description: ""),
    SelfImprovement(
        title: "Essential Qualities of a Loving and Supportive Partner", description: ""),
    SelfImprovement(
        title: "The Ultimate Guide to Building Emotional Intimacy in Your Relationship",
        description: ""),
    SelfImprovement(
        title: "How to Maintain a Healthy Work-Life Balance in a Relationship", description: ""),
    SelfImprovement(
        title: "Tips for Effective Conflict Resolution in Relationships", description: ""),
    SelfImprovement(
        title: "Ways to Show Appreciation and Gratitude to Your Partner", description: ""),
    SelfImprovement(
        title: "Strategies for Keeping the Spark Alive in Long-Term Relationships",
        description: ""),
    SelfImprovement(
        title: "How to Cultivate Trust and Transparency in Your Relationship", description: ""),
    SelfImprovement(title: "Creative Date Ideas to Strengthen Your Bond", description: ""),
    SelfImprovement(
        title: "The Art of Active Listening: Improving Communication with Your Partner",
        description: ""),
    SelfImprovement(
        title: "How to Support Your Partner's Personal Growth and Goals", description: ""),
    SelfImprovement(
        title: "Navigating Differences: Respecting and Embracing Your Partner's Views",
        description: ""),
    SelfImprovement(
        title: "Building a Strong Foundation: Core Values for a Lasting Relationship",
        description: ""),
    SelfImprovement(
        title: "Understanding Love Languages: How to Express Love in the Best Way for Your Partner",
        description: ""),
    SelfImprovement(
        title: "The Importance of Self-Care and Individuality in a Relationship", description: ""),
    SelfImprovement(
        title: "Balancing Independence and Togetherness in Your Relationship", description: ""),
  ];
}
