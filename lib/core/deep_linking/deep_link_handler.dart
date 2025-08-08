import 'package:go_router/go_router.dart';
import 'link_parser.dart';
import 'package:app_links/app_links.dart';

class DeepLinkHandler {
  final GoRouter router;

  DeepLinkHandler(this.router) {
    _init();
  }

  void _init() async {
    // Handle links when app is initially launched
    final appLinks = AppLinks();
    final initialUri = await appLinks.getInitialLink();
    if (initialUri != null) {
      _handleDeepLink(initialUri);
    }

    // Handle links while app is running
    appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) _handleDeepLink(uri);
    });
  }

  void _handleDeepLink(Uri uri) {
    final route = DeepLinkParser.parseRoute(uri);
    if (route != null) {
      router.go(route);
    }
  }
}
