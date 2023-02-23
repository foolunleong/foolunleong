import 'package:etiqa/features/add_card/add_cart.dart';
import 'package:etiqa/features/home/home.dart';
import 'package:etiqa/settings/settings_controller.dart';
import 'package:flutter/material.dart';

Widget routeHandler(String route, SettingsController controller) =>
    routeName(controller)[route]!;

Map<String, Widget> routeName(SettingsController controller) => {
      '/': const LandingScreen(),
      AddCardScreen.routeName: const AddCardScreen(),
      LandingScreen.routeName: const LandingScreen()
    };
