import 'package:get/get.dart';
import 'package:tyba_todo/application/form_task/form_task_controller.dart';

class FormTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FormTaskController(
        localDbRepository: Get.find(),
      ),
    );
  }
}
