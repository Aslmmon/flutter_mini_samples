import 'package:get/get.dart';
import 'package:onboarding_app/presentation/onBoarding/onBoardingViewModel.dart';

class AppBindings implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingViewModel());
  }
}
