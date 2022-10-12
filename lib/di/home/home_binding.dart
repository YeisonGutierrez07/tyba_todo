import 'package:get/get.dart';
import 'package:tyba_todo/application/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        localDbRepository: Get.find(),
      ),
    );
  }
}
