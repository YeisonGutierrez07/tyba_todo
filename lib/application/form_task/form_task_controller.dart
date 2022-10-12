import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tyba_todo/domain/core/entities/task.dart';
import 'package:tyba_todo/domain/local_db/i_local_db_repository.dart';

class FormTaskController extends GetxController {
  FormTaskController({
    required this.localDbRepository,
  });

  final ILocalDbRepository localDbRepository;

  // Form Fields

  GlobalKey<FormState> formTaskKey = GlobalKey<FormState>();

  final TextEditingController nameField = TextEditingController.fromValue(
    TextEditingValue.empty,
  );
  final TextEditingController descriptionField =
      TextEditingController.fromValue(
    TextEditingValue.empty,
  );

  late Task taskForm = Task.empty();

  @override
  void onReady() {
    loadArguments();
    super.onReady();
  }

  Future<void> loadArguments() async {
    taskForm = Get.arguments as Task;

    if (taskForm.id != 0) {
      nameField.text = taskForm.name;
      descriptionField.text = taskForm.description;
    }
  }

  Future<void> validateForm() async {
    if (formTaskKey.currentState?.validate() ?? false) {
      final result;
      taskForm = taskForm.copyWith(
        name: nameField.text,
        description: descriptionField.text,
      );

      if (taskForm.id != 0) {
        result = await localDbRepository.update(
          taskForm,
        );
      } else {
        result = await localDbRepository.save(
          taskForm,
        );
      }

      Get.back(result: result);
    }
  }
}
