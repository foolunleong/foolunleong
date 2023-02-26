import 'package:etiqa/features/home/home.dart';
import 'package:etiqa/settings/settings_controller.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETIQA by Foo Lun Leong',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) => FluroRouter.appRouter
          .matchRoute(context, settings.name, routeSettings: settings)
          .route,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => const Scaffold(
                  body: Text('Not Found'),
                ));
      },
    );
  }
}
