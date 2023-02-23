import 'package:etiqa/settings/routes.dart';
import 'package:etiqa/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;
  const MyApp({Key? key, required this.settingsController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETIQA by Foo Lun Leong',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return PageRouteBuilder(
            settings: routeSettings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                routeHandler(routeSettings.name!, settingsController),
            transitionsBuilder: (_, a, __, c) => FadeTransition(
                  opacity: a,
                  child: c,
                ));
      },
    );
  }
}
