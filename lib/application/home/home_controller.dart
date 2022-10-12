import 'package:get/get.dart';
import 'package:tyba_todo/domain/core/entities/task.dart';
import 'package:tyba_todo/domain/local_db/i_local_db_repository.dart';
import 'package:tyba_todo/presentation/routes/navigation.dart';

class HomeController extends GetxController {
  HomeController({
    required this.localDbRepository,
  });

  final ILocalDbRepository localDbRepository;

  RxList<Task> taskList = <Task>[].obs;
  RxBool loading = false.obs;

  @override
  void onReady() {
    initSqlite();
    super.onReady();
  }

  Future<void> initSqlite() async {
    await localDbRepository.init();
    getAllTasks();
  }

  void getAllTasks() async {
    loading(true);
    final listAlltasks = await localDbRepository.getAll();
    taskList.value = listAlltasks;
    await Future.delayed(const Duration(milliseconds: 500));
    loading(false);
  }

  void goToCreateNewTask() async {
    final result = await Get.toNamed(
      AppRoutes.formTask,
      arguments: Task.empty(),
    );
    if (result != null) {
      getAllTasks();
    }
  }

  deleteTask(Task task) async {
    await localDbRepository.delete(task.id);
    getAllTasks();
  }

  editTask(Task task) async {
    final result = await Get.toNamed(
      AppRoutes.formTask,
      arguments: task,
    );
    if (result != null) {
      getAllTasks();
    }
  }
}
