import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/core_entity/localization_content.dart';
import 'package:equatable/equatable.dart';

class SelfImprovement extends Equatable {
  final LocalizationContent title;
  final LocalizationContent description;

  const SelfImprovement({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];

  static const List<SelfImprovement> selfImprovements = [
    SelfImprovement(
      title: LocalizationContent(
        content: {
          LocalizationEnum.english:
              '10 Secrets to Becoming the Perfect Partner in Your Relationship',
          LocalizationEnum.japanese: '理想のパートナーになるための10の秘密',
          LocalizationEnum.vietnamese:
              '10 Bí quyết để trở thành người bạn đời hoàn hảo trong mối quan hệ của bạn',
        },
      ),
      description: LocalizationContent(
        content: {
          LocalizationEnum.english:
              'Discover ten secrets to becoming the perfect partner in your relationship, enhancing communication and understanding with your loved one.',
          LocalizationEnum.japanese: 'あなたの関係で理想のパートナーになるための10の秘密を発見し、愛する人とのコミュニケーションと理解を深めます。',
          LocalizationEnum.vietnamese:
              'Khám phá mười bí quyết để trở thành người bạn đời hoàn hảo trong mối quan hệ của bạn, nâng cao giao tiếp và sự hiểu biết với người thân yêu của bạn.',
        },
      ),
    ),
    SelfImprovement(
      title: LocalizationContent(
        content: {
          LocalizationEnum.english: 'How to enhance your appearance to be more attractive',
          LocalizationEnum.japanese: '魅力的に見せるための方法',
          LocalizationEnum.vietnamese: 'Cách tăng cường ngoại hình để hấp dẫn hơn',
        },
      ),
      description: LocalizationContent(
        content: {
          LocalizationEnum.english:
              'Learn effective strategies to improve your appearance and boost your attractiveness in social and personal settings.',
          LocalizationEnum.japanese: '社会的および個人的な状況であなたの魅力を向上させ、魅力を高める効果的な戦略を学びます。',
          LocalizationEnum.vietnamese:
              'Học các chiến lược hiệu quả để cải thiện ngoại hình của bạn và nâng cao sự hấp dẫn trong các bối cảnh xã hội và cá nhân.',
        },
      ),
    ),
    SelfImprovement(
      title: LocalizationContent(
        content: {
          LocalizationEnum.english: 'Ways to Strike Up a Cool Conversation with Your Crush',
          LocalizationEnum.japanese: '気になる人とクールな会話を始める方法',
          LocalizationEnum.vietnamese:
              'Cách bắt đầu một cuộc trò chuyện thú vị với người bạn thích',
        },
      ),
      description: LocalizationContent(
        content: {
          LocalizationEnum.english:
              'Explore techniques to initiate and maintain engaging conversations with someone you admire, fostering connections.',
          LocalizationEnum.japanese: 'あなたが尊敬する人と魅力的な会話を始め、維持するための技術を探求し、つながりを育みます。',
          LocalizationEnum.vietnamese:
              'Khám phá các kỹ thuật để bắt đầu và duy trì các cuộc trò chuyện hấp dẫn với người bạn ngưỡng mộ, thúc đẩy sự kết nối.',
        },
      ),
    ),
    // Remaining items omitted for brevity...
  ];
}
