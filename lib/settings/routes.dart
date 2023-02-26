import 'package:etiqa/features/detail/detail.dart';
import 'package:etiqa/features/home/home.dart';
import 'package:fluro/fluro.dart';

int transitionDuration = 300;
TransitionType transitionType = TransitionType.fadeIn;

void buildFluro() {
  FluroRouter.appRouter
    ..define(
      '/',
      transitionType: transitionType,
      transitionDuration: Duration(milliseconds: transitionDuration),
      handler: Handler(handlerFunc: (context, params) => const HomeScreen()),
    )
    ..define(
      HomeScreen.routeName,
      transitionType: transitionType,
      transitionDuration: Duration(milliseconds: transitionDuration),
      handler: Handler(handlerFunc: (context, params) => const HomeScreen()),
    )
    ..define(
      AddCardScreen.routeName,
      transitionType: TransitionType.inFromRight,
      transitionDuration: Duration(milliseconds: transitionDuration),
      handler: Handler(handlerFunc: (context, params) {
        int id = 0;

        if (params['id'] != null) {
          id = int.parse(params['id']!.first);
        }

        return AddCardScreen(id: id);
      }),
    );
}
