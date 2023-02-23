import 'package:etiqa/providers/_providers.dart';
import 'package:etiqa/app.dart';
import 'package:etiqa/settings/settings_controller.dart';
import 'package:etiqa/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final settingsController = SettingsController(SettingsService());

  runApp(
    MultiProvider(
      providers: etiqaProviders(),
      child: MyApp(settingsController: settingsController),
    ),
  );
}
