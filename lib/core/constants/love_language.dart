import 'package:cupid_mentor/core/constants/localization_const.dart';
import 'package:cupid_mentor/core/core_object/localization_content.dart';

class LoveLanguage {
  static const LocalizationContent reasonOfConcept = LocalizationContent(
    content: {
      LocalizationEnum.english:
          'The concept of love languages is essential because it enhances communication by clarifying how individuals express and perceive love differently. This understanding leads to stronger emotional bonds, greater relationship satisfaction, personal growth through self-awareness, effective conflict resolution based on emotional needs, and applies broadly across various relationships, fostering deeper connections overall.',
      LocalizationEnum.japanese:
          '愛の言語の概念は、人々がどのように愛を表現し、認識するかを明確にすることでコミュニケーションを向上させるため、非常に重要です。この理解は、感情的な絆を強め、関係の満足度を高め、自己認識を通じた個人的な成長を促進し、感情的なニーズに基づく効果的な紛争解決を可能にし、さまざまな関係全体に広く適用され、より深い繋がりを育むものです。',
      LocalizationEnum.vietnamese:
          'Khái niệm về ngôn ngữ tình yêu rất quan trọng vì nó nâng cao giao tiếp bằng cách làm rõ cách mọi người thể hiện và cảm nhận tình yêu khác nhau. Sự hiểu biết này dẫn đến mối quan hệ tình cảm mạnh mẽ hơn, sự hài lòng trong mối quan hệ lớn hơn, sự phát triển cá nhân thông qua nhận thức về bản thân, giải quyết xung đột hiệu quả dựa trên nhu cầu tình cảm và áp dụng rộng rãi trong các mối quan hệ khác nhau, thúc đẩy sự kết nối sâu sắc hơn.',
    },
  );

  static const LocalizationContent overallInfo = LocalizationContent(
    content: {
      LocalizationEnum.english:
          'The concept of love languages refers to the idea that people express and experience love in different ways. It was introduced by Dr. Gary Chapman in his book "The 5 Love Languages," which outlines five primary ways that individuals tend to give and receive love. These love languages are:',
      LocalizationEnum.japanese:
          '愛の言語の概念は、人々が異なる方法で愛を表現し、体験するという考えを指します。これは、ゲイリー・チャップマン博士が彼の本「5つの愛の言語」で紹介したもので、個人が愛を与えたり受け取ったりする5つの主要な方法を概説しています。これらの愛の言語は次のとおりです：',
      LocalizationEnum.vietnamese:
          'Khái niệm về ngôn ngữ tình yêu đề cập đến ý tưởng rằng mọi người thể hiện và trải nghiệm tình yêu theo những cách khác nhau. Nó được giới thiệu bởi Tiến sĩ Gary Chapman trong cuốn sách "5 Ngôn ngữ Tình Yêu" của ông, trong đó phác thảo năm cách chính mà các cá nhân có xu hướng trao và nhận tình yêu. Những ngôn ngữ tình yêu này là:',
    },
  );
  static Map<String, (LocalizationContent, LocalizationContent)> loveLanguages = {
    'wordsOfAffirmation': (
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Words of Affirmation',
          LocalizationEnum.japanese: '肯定の言葉',
          LocalizationEnum.vietnamese: 'Lời nói khẳng định',
        },
      ),
      const LocalizationContent(
        content: {
          LocalizationEnum.english:
              'Expressing love and appreciation through spoken or written words.',
          LocalizationEnum.japanese: '言葉や文章を通じて愛や感謝を伝えること。',
          LocalizationEnum.vietnamese:
              'Thể hiện tình yêu và sự trân trọng qua lời nói hoặc văn bản.',
        },
      )
    ),
    'actsOfService': (
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Acts of Service',
          LocalizationEnum.japanese: '奉仕の行為',
          LocalizationEnum.vietnamese: 'Hành động',
        },
      ),
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Showing love by doing things for the other person.',
          LocalizationEnum.japanese: '相手のために行動することで愛を示すこと。',
          LocalizationEnum.vietnamese: 'Thể hiện tình yêu qua những hành động giúp đỡ đối phương',
        },
      )
    ),
    'gifts': (
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Gifts',
          LocalizationEnum.japanese: '贈り物',
          LocalizationEnum.vietnamese: 'Quà tặng',
        },
      ),
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Giving and receiving gifts as a way to express love.',
          LocalizationEnum.japanese: 'プレゼントを贈ることで愛を表現すること。',
          LocalizationEnum.vietnamese: 'Tặng quà và nhận quà như một cách để bày tỏ tình yêu.',
        },
      )
    ),
    'qualityTime': (
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Quality Time',
          LocalizationEnum.japanese: '質の高い時間',
          LocalizationEnum.vietnamese: 'Thời gian chất lượng',
        },
      ),
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Spending meaningful time together.',
          LocalizationEnum.japanese: '一緒に大切な時間を過ごすこと。',
          LocalizationEnum.vietnamese: 'Dành thời gian ý nghĩa bên nhau.',
        },
      )
    ),
    'physicalTouch': (
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Physical Touch',
          LocalizationEnum.japanese: '身体的接触',
          LocalizationEnum.vietnamese: 'Tiếp xúc cơ thể',
        },
      ),
      const LocalizationContent(
        content: {
          LocalizationEnum.english: 'Expressing love through physical contact.',
          LocalizationEnum.japanese: '触れ合いを通じて愛を伝えること。',
          LocalizationEnum.vietnamese: 'Thể hiện tình yêu qua việc tiếp xúc cơ thể.',
        },
      )
    ),
  };
}
