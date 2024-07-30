import 'package:cupid_mentor/core/assets/assets.gen.dart';
import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SelfImprovementCategory extends Equatable {
  final Widget image;
  final LocalizationContent title;

  const SelfImprovementCategory({required this.image, required this.title});

  @override
  List<Object?> get props => [title, image];

  static final categoryBuildStrongRelationShips = SelfImprovementCategory(
    image: Assets.png.strongRelationshipImage.image(),
    title: const LocalizationContent(
      content: {
        LocalizationEnum.english: 'Building Strong Relationships',
        LocalizationEnum.japanese: '強い関係を築く',
        LocalizationEnum.vietnamese: 'Xây dựng mối quan hệ vững chắc',
      },
      id: 'buildStrongRelationShips',
    ),
  );

  static final categoryPersonalDevelopmentAndSelfCare = SelfImprovementCategory(
    image: Assets.png.selfImprovementImage.image(),
    title: const LocalizationContent(
      content: {
        LocalizationEnum.english: 'Personal Development and Self-Care',
        LocalizationEnum.japanese: '個人の成長とセルフケア',
        LocalizationEnum.vietnamese: 'Phát triển cá nhân và chăm sóc bản thân',
      },
      id: 'personalDevelopmentAndSelfCare',
    ),
  );

  static final categoryCommunicationAndConflictResolution = SelfImprovementCategory(
    image: Assets.png.conflictImage.image(),
    title: const LocalizationContent(
      content: {
        LocalizationEnum.english: 'Communication and Conflict Resolution',
        LocalizationEnum.japanese: 'コミュニケーションと対立解決',
        LocalizationEnum.vietnamese: 'Giao tiếp và giải quyết mâu thuẫn',
      },
      id: 'communicationAndConflictResolution',
    ),
  );

  static final categories = [
    categoryBuildStrongRelationShips,
    categoryCommunicationAndConflictResolution,
    categoryPersonalDevelopmentAndSelfCare,
  ];
}

class SelfImprovement extends Equatable {
  final String id;
  final LocalizationContent title;
  final LocalizationContent description;

  const SelfImprovement({required this.title, required this.description, required this.id});

  @override
  List<Object?> get props => [title, description];

  static Map<String, List<SelfImprovement>> selfImprovements = {
    SelfImprovementCategory.categoryBuildStrongRelationShips.title.id ?? '': const [
      SelfImprovement(
        id: '10SecretsToBecomingPerfectPartner',
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
        id: 'essentialQualitiesOfALovingAndSupportivePartner',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: 'Essential Qualities of a Loving and Supportive Partner',
            LocalizationEnum.japanese: '愛情深く支援するパートナーの必要な資質',
            LocalizationEnum.vietnamese:
                'Những phẩm chất cần thiết của một người bạn đời yêu thương và hỗ trợ',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover the essential qualities that make a loving and supportive partner.',
            LocalizationEnum.japanese: '愛情深く支援するパートナーに必要な資質を発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá những phẩm chất cần thiết để trở thành một người bạn đời yêu thương và hỗ trợ.',
          },
        ),
      ),
      SelfImprovement(
        id: 'theUltimateGuideToBuildingEmotionalIntimacyInYourRelationship',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'The Ultimate Guide to Building Emotional Intimacy in Your Relationship',
            LocalizationEnum.japanese: 'あなたの関係における感情的な親密さを築くための究極のガイド',
            LocalizationEnum.vietnamese:
                'Hướng dẫn tối ưu để xây dựng sự gần gũi về cảm xúc trong mối quan hệ của bạn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn how to build deep emotional intimacy in your relationship with this ultimate guide.',
            LocalizationEnum.japanese: 'この究極のガイドで、あなたの関係における深い感情的な親密さを築く方法を学びます。',
            LocalizationEnum.vietnamese:
                'Học cách xây dựng sự gần gũi về cảm xúc sâu sắc trong mối quan hệ của bạn với hướng dẫn tối ưu này.',
          },
        ),
      ),
      SelfImprovement(
        id: 'buildingAStrongFoundation',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Building a Strong Foundation: Core Values for a Lasting Relationship',
            LocalizationEnum.japanese: '強固な基盤を築く: 永続する関係のためのコアバリュー',
            LocalizationEnum.vietnamese:
                'Xây dựng nền tảng vững chắc: Những giá trị cốt lõi cho một mối quan hệ bền vững',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover the core values that help build a strong foundation for a lasting relationship.',
            LocalizationEnum.japanese: '永続する関係のための強固な基盤を築くコアバリューを発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá những giá trị cốt lõi giúp xây dựng nền tảng vững chắc cho một mối quan hệ bền vững.',
          },
        ),
      ),
      SelfImprovement(
        id: 'understandingLoveLanguages',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Understanding Love Languages: How to Express Love in the Best Way for Your Partner',
            LocalizationEnum.japanese: '愛の言語を理解する: あなたのパートナーにとって最良の方法で愛を表現する方法',
            LocalizationEnum.vietnamese:
                'Hiểu về ngôn ngữ tình yêu: Cách thể hiện tình yêu tốt nhất với bạn đời',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn about love languages and how to express love in the best way for your partner.',
            LocalizationEnum.japanese: '愛の言語について学び、あなたのパートナーにとって最良の方法で愛を表現する方法を学びます。',
            LocalizationEnum.vietnamese:
                'Tìm hiểu về ngôn ngữ tình yêu và cách thể hiện tình yêu tốt nhất với bạn đời.',
          },
        ),
      ),
      SelfImprovement(
        id: 'strategiesForKeepingTheSparkAliveInLongTermRelationships',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Strategies for Keeping the Spark Alive in Long-Term Relationships',
            LocalizationEnum.japanese: '長期的な関係でスパークを維持するための戦略',
            LocalizationEnum.vietnamese: 'Chiến lược để giữ lửa trong các mối quan hệ lâu dài',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn strategies to keep the spark alive in long-term relationships.',
            LocalizationEnum.japanese: '長期的な関係でスパークを維持するための戦略を学びます。',
            LocalizationEnum.vietnamese:
                'Học các chiến lược để giữ lửa trong các mối quan hệ lâu dài.',
          },
        ),
      ),
      SelfImprovement(
        id: 'howToCultivateTrustAndTransparencyInYourRelationship',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'How to Cultivate Trust and Transparency in Your Relationship',
            LocalizationEnum.japanese: 'あなたの関係で信頼と透明性を育む方法',
            LocalizationEnum.vietnamese:
                'Cách nuôi dưỡng lòng tin và sự minh bạch trong mối quan hệ của bạn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover ways to cultivate trust and transparency in your relationship.',
            LocalizationEnum.japanese: 'あなたの関係で信頼と透明性を育む方法を発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá những cách để nuôi dưỡng lòng tin và sự minh bạch trong mối quan hệ của bạn.',
          },
        ),
      ),
      SelfImprovement(
        id: 'balancingIndependenceAndTogethernessInYourRelationship',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Balancing Independence and Togetherness in Your Relationship',
            LocalizationEnum.japanese: 'あなたの関係で独立と一体感のバランスを取る',
            LocalizationEnum.vietnamese:
                'Cân bằng giữa sự độc lập và sự gắn kết trong mối quan hệ của bạn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn how to balance independence and togetherness in your relationship.',
            LocalizationEnum.japanese: 'あなたの関係で独立と一体感のバランスを取る方法を学びます。',
            LocalizationEnum.vietnamese:
                'Học cách cân bằng giữa sự độc lập và sự gắn kết trong mối quan hệ của bạn.',
          },
        ),
      ),
      SelfImprovement(
        id: 'creativeDateIdeasToStrengthenYourBond',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: 'Creative Date Ideas to Strengthen Your Bond',
            LocalizationEnum.japanese: 'あなたの絆を強化するためのクリエイティブなデートのアイデア',
            LocalizationEnum.vietnamese: 'Ý tưởng hẹn hò sáng tạo để tăng cường sự gắn kết của bạn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Find creative date ideas to strengthen your bond with your partner.',
            LocalizationEnum.japanese: 'あなたのパートナーとの絆を強化するための創造的なデートのアイデアを見つけましょう。',
            LocalizationEnum.vietnamese:
                'Tìm những ý tưởng hẹn hò sáng tạo để tăng cường sự gắn kết của bạn với bạn đời.',
          },
        ),
      ),
    ],
    SelfImprovementCategory.categoryPersonalDevelopmentAndSelfCare.title.id ?? '': const [
      SelfImprovement(
        id: 'howToEnhanceYourAppearanceToBeMoreAttractive',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: 'How to enhance your appearance to be more attractive',
            LocalizationEnum.japanese: 'もっと魅力的に見えるための方法',
            LocalizationEnum.vietnamese: 'Cách cải thiện ngoại hình của bạn để trở nên hấp dẫn hơn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn tips and tricks to enhance your physical appearance and boost your confidence.',
            LocalizationEnum.japanese: 'あなたの外見を向上させ、自信を高めるためのヒントとコツを学びます。',
            LocalizationEnum.vietnamese:
                'Học các mẹo và thủ thuật để cải thiện ngoại hình của bạn và tăng cường sự tự tin.',
          },
        ),
      ),
      SelfImprovement(
        id: 'howToEnhanceYourAppearanceToBeMoreAttractive',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'How to create a more attractive bio/profile on social media and dating apps',
            LocalizationEnum.japanese: 'ソーシャルメディアとデーティングアプリで魅力的なプロフィールを作成する方法',
            LocalizationEnum.vietnamese:
                'Cách tạo tiểu sử/hồ sơ hấp dẫn hơn trên mạng xã hội và ứng dụng hẹn hò',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn how to craft an attractive and engaging bio/profile on social media and dating apps.',
            LocalizationEnum.japanese: 'ソーシャルメディアとデーティングアプリで魅力的で魅力的なプロフィールを作成する方法を学びます。',
            LocalizationEnum.vietnamese:
                'Học cách tạo một tiểu sử/hồ sơ hấp dẫn và thú vị trên mạng xã hội và ứng dụng hẹn hò.',
          },
        ),
      ),
      SelfImprovement(
        id: 'howToSupportYourPartnersPersonalGrowthAndGoals',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: "How to Support Your Partner's Personal Growth and Goals",
            LocalizationEnum.japanese: 'パートナーの個人的な成長と目標を支援する方法',
            LocalizationEnum.vietnamese:
                'Cách hỗ trợ sự phát triển cá nhân và mục tiêu của bạn đời',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover ways to support your partner’s personal growth and goals.',
            LocalizationEnum.japanese: 'パートナーの個人的な成長と目標を支援する方法を発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá những cách để hỗ trợ sự phát triển cá nhân và mục tiêu của bạn đời.',
          },
        ),
      ),
      SelfImprovement(
        id: 'theImportanceOfSelfCareAndIndividualityInARelationship',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'The Importance of Self-Care and Individuality in a Relationship',
            LocalizationEnum.japanese: '関係におけるセルフケアと個性の重要性',
            LocalizationEnum.vietnamese:
                'Tầm quan trọng của việc chăm sóc bản thân và cá nhân trong mối quan hệ',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover the importance of self-care and individuality in maintaining a healthy relationship.',
            LocalizationEnum.japanese: '健全な関係を維持するためのセルフケアと個性の重要性を発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá tầm quan trọng của việc chăm sóc bản thân và cá nhân trong việc duy trì một mối quan hệ lành mạnh.',
          },
        ),
      ),
      SelfImprovement(
        id: 'howToMaintainAHealthyWorkLifeBalanceInARelationship',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'How to Maintain a Healthy Work-Life Balance in a Relationship',
            LocalizationEnum.japanese: '関係において健全な仕事と生活のバランスを維持する方法',
            LocalizationEnum.vietnamese:
                'Cách duy trì sự cân bằng lành mạnh giữa công việc và cuộc sống trong mối quan hệ',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover strategies to maintain a healthy work-life balance while nurturing your relationship.',
            LocalizationEnum.japanese: 'あなたの関係を育みながら健全な仕事と生活のバランスを維持するための戦略を発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá các chiến lược để duy trì sự cân bằng lành mạnh giữa công việc và cuộc sống trong khi nuôi dưỡng mối quan hệ của bạn.',
          },
        ),
      ),
    ],
    SelfImprovementCategory.categoryCommunicationAndConflictResolution.title.id ?? '': const [
      SelfImprovement(
        id: 'waysToStrikeUpACoolConversationWithYourCrush',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: 'Ways to Strike Up a Cool Conversation with Your Crush',
            LocalizationEnum.japanese: '好きな人とクールな会話を始める方法',
            LocalizationEnum.vietnamese: 'Cách bắt đầu cuộc trò chuyện thú vị với người bạn thích',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Find out the best ways to start a cool and engaging conversation with your crush.',
            LocalizationEnum.japanese: '好きな人とクールで魅力的な会話を始めるための最良の方法を見つけましょう。',
            LocalizationEnum.vietnamese:
                'Tìm hiểu những cách tốt nhất để bắt đầu một cuộc trò chuyện thú vị và hấp dẫn với người bạn thích.',
          },
        ),
      ),
      SelfImprovement(
        id: 'theArtOfActiveListening',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'The Art of Active Listening: Improving Communication with Your Partner',
            LocalizationEnum.japanese: '積極的な傾聴の芸術: あなたのパートナーとのコミュニケーションを改善する',
            LocalizationEnum.vietnamese:
                'Nghệ thuật lắng nghe chủ động: Cải thiện giao tiếp với bạn đời của bạn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn the art of active listening to improve communication with your partner.',
            LocalizationEnum.japanese: 'あなたのパートナーとのコミュニケーションを改善するための積極的な傾聴の芸術を学びます。',
            LocalizationEnum.vietnamese:
                'Học nghệ thuật lắng nghe chủ động để cải thiện giao tiếp với bạn đời của bạn.',
          },
        ),
      ),
      SelfImprovement(
        id: 'navigatingDifferencesRespectingAndEmbracingYourPartnersViews',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english:
                "Navigating Differences: Respecting and Embracing Your Partner's Views",
            LocalizationEnum.japanese: '違いをナビゲートする: あなたのパートナーの見解を尊重し受け入れる',
            LocalizationEnum.vietnamese:
                'Điều hướng sự khác biệt: Tôn trọng và đón nhận quan điểm của bạn đời',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn how to navigate differences by respecting and embracing your partner’s views.',
            LocalizationEnum.japanese: 'あなたのパートナーの見解を尊重し受け入れることによって、違いをナビゲートする方法を学びます。',
            LocalizationEnum.vietnamese:
                'Học cách điều hướng sự khác biệt bằng cách tôn trọng và đón nhận quan điểm của bạn đời.',
          },
        ),
      ),
      SelfImprovement(
        id: 'tipsForEffectiveConflictResolutionInRelationships',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: 'Tips for Effective Conflict Resolution in Relationships',
            LocalizationEnum.japanese: '関係における効果的な紛争解決のためのヒント',
            LocalizationEnum.vietnamese:
                'Mẹo để giải quyết xung đột hiệu quả trong các mối quan hệ',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Learn effective conflict resolution tips to handle disagreements in your relationship.',
            LocalizationEnum.japanese: 'あなたの関係における意見の不一致を処理するための効果的な紛争解決のヒントを学びます。',
            LocalizationEnum.vietnamese:
                'Học các mẹo giải quyết xung đột hiệu quả để xử lý những bất đồng trong mối quan hệ của bạn.',
          },
        ),
      ),
      SelfImprovement(
        id: 'waysToShowAppreciationAndGratitudeToYourPartner',
        title: LocalizationContent(
          content: {
            LocalizationEnum.english: 'Ways to Show Appreciation and Gratitude to Your Partner',
            LocalizationEnum.japanese: 'あなたのパートナーに感謝と感謝を示す方法',
            LocalizationEnum.vietnamese:
                'Những cách để thể hiện sự cảm kích và lòng biết ơn đối với bạn đời của bạn',
          },
        ),
        description: LocalizationContent(
          content: {
            LocalizationEnum.english:
                'Discover meaningful ways to show appreciation and gratitude to your partner.',
            LocalizationEnum.japanese: 'あなたのパートナーに感謝と感謝を示すための意味のある方法を発見します。',
            LocalizationEnum.vietnamese:
                'Khám phá những cách có ý nghĩa để thể hiện sự cảm kích và lòng biết ơn đối với bạn đời của bạn.',
          },
        ),
      ),
    ],
  };
}
