import 'package:get/get.dart';
import 'package:untitled/onBoardingApp/domain/model/OnBoardingData.dart';

class OnBoardingViewModel extends GetxController {
  final onBoardingList = <OnBoardingData>[].obs;
  final starterOnBoardingIndex = 0.obs;

  setIndicatorPoint(int trackerDot) =>
      starterOnBoardingIndex.value = trackerDot;

  providerOnBoardingList() {
    onBoardingList.addAll([
      OnBoardingData(
          title: 'Add', imagePath: '', subtitle: 'Easily add all your bottles'),
      OnBoardingData(
          title: 'Track', imagePath: '', subtitle: 'See hoe many you need'),
      OnBoardingData(
          title: 'Share',
          imagePath: '',
          subtitle: 'Automatically update your social network when you drink')
    ]);
  }

  OnBoardingData getSelectedOnBoardingItem() =>
      onBoardingList[starterOnBoardingIndex.value];

  List<OnBoardingData> getOnBoardingList() => onBoardingList.value;
}

class OnBoardingData {
  final String title;
  final String subtitle;
  final String imagePath;

  OnBoardingData(
      {required this.title, required this.subtitle, required this.imagePath});
}
