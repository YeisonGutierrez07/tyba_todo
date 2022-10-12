import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tyba_todo/di/main_binding.dart';
import 'package:tyba_todo/domain/core/entities/flavor_config.dart';
import 'package:tyba_todo/presentation/routes/navigation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key, required this.config});

  final FlavorConfig config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: config.appName,
      initialBinding: MainBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
