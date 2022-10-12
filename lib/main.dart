import 'package:flutter/material.dart';
import 'package:tyba_todo/app_widget.dart';
import 'package:tyba_todo/domain/core/entities/flavor_config.dart';

void mainCommon(FlavorConfig config) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    AppWidget(
      config: config,
    ),
  );
}
