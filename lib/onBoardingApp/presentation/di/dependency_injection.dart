import 'package:get/get.dart';
import 'package:untitled/onBoardingApp/presentation/onBoarding/onBoardingViewModel.dart';

class AppBindings implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingViewModel());
  }
}
