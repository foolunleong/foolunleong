// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:etiqa/features/detail/detail.dart';
import 'package:etiqa/features/home/home.dart';
import 'package:etiqa/models/data_model.dart';
import 'package:etiqa/providers/user_provider.dart';
import 'package:etiqa/settings/settings_controller.dart';
import 'package:etiqa/widgets/fields/calendar_picker.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late UserProvider userProvider;
  List<SingleChildWidget> etiqaProviders() =>
      [ChangeNotifierProvider(create: (_) => UserProvider())];

  // Arrange - runs before every test case
  setUp(() {
    userProvider = UserProvider();
  });

  // Objects
  List<TodoModel> dataTodo = [
    TodoModel(
        id: 1,
        title: 'Automated Testing Script',
        status: 1,
        completed: false,
        startDate: DateTime(2023, 2, 20),
        endDate: DateTime(2023, 3, 28),
        timeLeft: 200),
    TodoModel(
        id: 2,
        title: 'Automated Production',
        status: 1,
        completed: true,
        startDate: DateTime(2023, 2, 20),
        endDate: DateTime(2023, 3, 15),
        timeLeft: 200)
  ];

  // This group is target that test functions
  group("Get the list of Todo and get the detail of todo", () {
    test("todo list", () {
      // Act
      List<TodoModel> result = userProvider.datas;
      result.addAll(dataTodo);

      // Assert
      expect(result, dataTodo);
    });

    test("todo detail", () {
      userProvider.datas.addAll(dataTodo);
      //Select the card to display the detail from the list
      TodoModel result = userProvider.getDetail(1);

      // Expected the correct result
      expect(result, dataTodo[0]);
    });
  });

  // This group is target that test functions
  group("Create and update the card", () {
    int transitionDuration = 300;
    TransitionType transitionType = TransitionType.fadeIn;
    var router = FluroRouter();

    router.define(
      '/',
      transitionType: transitionType,
      transitionDuration: Duration(milliseconds: transitionDuration),
      handler: Handler(handlerFunc: (context, params) => const HomeScreen()),
    );
    router.define(
      HomeScreen.routeName,
      transitionType: transitionType,
      transitionDuration: Duration(milliseconds: transitionDuration),
      handler: Handler(handlerFunc: (context, params) => const HomeScreen()),
    );
    router.define(
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
    testWidgets("add card", (tester) async {
      // create a mock widget to use as the app root
      var appHome = MultiProvider(
          providers: etiqaProviders(),
          child: MaterialApp(
            title: 'ETIQA by Foo Lun Leong',
            restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyCustomScrollBehavior(),
            initialRoute: HomeScreen.routeName,
            onGenerateRoute: (settings) => router.generator(settings),
            onUnknownRoute: (RouteSettings settings) {
              return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (BuildContext context) => const Scaffold(
                        body: Text('Not Found'),
                      ));
            },
          ));

      // navigate to the home route
      // await tester.pumpWidget(appHome);
      // FluroRouter.appRouter
      //     .navigateTo(scaffoldKey.currentContext!, HomeScreen.routeName);
      // await tester.pumpAndSettle();

      // expect(find.text('Home'), findsOneWidget);

      //initial is the list of To-Do
      userProvider.datas.addAll(dataTodo);

      //Arrange
      //initial is the list of controller connected with the field text and picker date
      final List<TextEditingController> controllers = [
        TextEditingController(text: 'Welcome'),
        TextEditingController(text: formatDate(DateTime.now())),
        TextEditingController(text: formatDate(DateTime.now())),
      ];

      // Act
      //This function is that it opened the card detail from list of card To-Do.
      // userProvider.addCard(scaffoldKey.currentContext!, controllers, 0);

      //This function is that the check is allowed to tick or empty.
      userProvider.completedCheck(true, 1);

      //This function is that the check is allowed to tick or empty.
      // userProvider.createCard(scaffoldKey.currentContext!);
      // userProvider.openDetail(scaffoldKey.currentContext!, 0);

      // Assert
      // Expected the correct result.
      expect(controllers[0].text, 'Welcome');
      expect(controllers[1].text, formatDate(DateTime.now()));
      expect(controllers[2].text, formatDate(DateTime.now()));
    });
  });

  test("cal total Clock", () {
    calTotalClock(DateTime(2022), DateTime(2023));
  });
}
