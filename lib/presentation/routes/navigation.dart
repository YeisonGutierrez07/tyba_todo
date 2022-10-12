import 'package:get/get_navigation/get_navigation.dart';
import 'package:tyba_todo/di/form_task/form_task_binding.dart';
import 'package:tyba_todo/di/home/home_binding.dart';
import 'package:tyba_todo/presentation/pages/form_task/form_task_page.dart';
import 'package:tyba_todo/presentation/pages/home/home_page.dart';

class AppRoutes {
  static String home = '/home';
  static String formTask = '/form_task';
}

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<HomePage>(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    GetPage<FormTaskPage>(
      name: AppRoutes.formTask,
      binding: FormTaskBinding(),
      page: () => const FormTaskPage(),
    ),
  ];
}
