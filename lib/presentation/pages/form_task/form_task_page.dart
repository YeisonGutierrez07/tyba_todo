import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tyba_todo/application/form_task/form_task_controller.dart';
import 'package:tyba_todo/presentation/global_widgets/text_title.dart';
import 'package:tyba_todo/presentation/pages/form_task/widgets/custom_text_form_field.dart';

class FormTaskPage extends GetWidget<FormTaskController> {
  const FormTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormTaskController>(
      builder: (FormTaskController _) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: _.formTaskKey,
            child: Column(
              children: [
                TextTitle(title: "Formulario de Tareas"),
                CustomTextFormField(
                  controller: _.nameField,
                  decoration: InputDecoration(
                    icon: Icon(Icons.task),
                    hintText: 'Escriba la tarea',
                    labelText: 'Tarea',
                  ),
                ),
                CustomTextFormField(
                  controller: _.descriptionField,
                  decoration: InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: 'Haga una descripción de la tarea',
                    labelText: 'Descripción',
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: _.validateForm,
                  child: Text(
                    _.taskForm.id != 0
                        ? 'Crear nueva tarea'
                        : 'Editar la tarea',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
