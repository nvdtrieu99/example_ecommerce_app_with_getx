import 'package:get/get.dart';

class DashBoardController extends GetxController {
  int currentIndex = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    changTabIndex(0);
  }

  void changTabIndex(int index) {
    currentIndex = index;
    update();
  }
}
