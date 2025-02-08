import 'package:lab_talk_firebase/core/util/assets_path.dart';
import 'package:lab_talk_firebase/domain/model/splash_screen_item.dart';

class SplashScreenItems {
  final List<SplashScreenItem> items = [
    SplashScreenItem(
      title: '실험실 견적, 이제는 쉽고 빠르게',
      description: '원하는 실험 장비와 소모품을 등록하면, 국내 유통업체들이 최적의 견적을 제안해드립니다',
      image: AssetsPath.onboarding1,
    ),
    SplashScreenItem(
      title: '국산 실험 장비를 우선적으로',
      description:
          '검증된 국내 제조사의 제품을 합리적인 가격에 만나보세요. 수입 제품보다 빠른 AS와 기술 지원을 받을 수 있습니다',
      image: AssetsPath.onboarding2,
    ),
    SplashScreenItem(
      title: '실시간 견적 비교로 예산 절감',
      description: '여러 업체의 견적을 한눈에 비교하고, 연구비를 효율적으로 사용하세요',
      image: AssetsPath.onboarding3,
    ),
    SplashScreenItem(
      title: '빠른 납기와 철저한 품질 관리',
      description: '국내 제조사와 직접 연결되어 신속한 배송과 철저한 품질 보증을 약속드립니다',
      image: AssetsPath.onboarding4,
    ),
  ];
}
