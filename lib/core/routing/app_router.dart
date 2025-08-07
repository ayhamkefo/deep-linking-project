import 'package:deeplinking_project/main.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  //auth pages
  static const String kHomePageRoute = '/homePage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    ],
  );
}
