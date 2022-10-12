import 'package:flutter/material.dart';
import 'package:tyba_todo/application/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:tyba_todo/presentation/global_widgets/text_title.dart';
import 'package:tyba_todo/presentation/pages/home/widgets/task_tile.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (HomeController _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tyba TODO'),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _.goToCreateNewTask,
                child: const Text('Crear nueva tarea'),
              ),
            ),
            body: Obx(
              () {
                if (_.loading.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextTitle(title: "Listado de tareas"),
                      const Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: List<Widget>.generate(
                            _.taskList.length,
                            (int ind) => Column(
                              children: <Widget>[
                                TaskTile(
                                  task: _.taskList[ind],
                                ),
                                const Divider(
                                  thickness: 1.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
