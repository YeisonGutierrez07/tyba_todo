import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tyba_todo/application/home/home_controller.dart';
import 'package:tyba_todo/domain/core/entities/task.dart';

class TaskTile extends GetWidget<HomeController> {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                task.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                task.description,
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () => controller.deleteTask(task),
              icon: const Icon(
                Icons.delete,
              ),
            ),
            IconButton(
              onPressed: () => controller.editTask(task),
              icon: const Icon(
                Icons.edit,
              ),
            ),
          ],
        )
      ],
    );
  }
}
