import 'package:deeplinking_project/core/routing/route_paths.dart';
import 'package:deeplinking_project/feature/home/presentations/veiws/home_screen.dart';
import 'package:deeplinking_project/feature/home/presentations/veiws/proudct_details_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: RoutePaths.home, builder: (context, state) => const HomeScreen()),
      GoRoute(
        path: RoutePaths.productDetail,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailScreen(productId: id);
        },
      ),
    ],
  );
}
