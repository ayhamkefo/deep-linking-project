import 'package:deeplinking_project/core/services/api/urls.dart';

class DeepLinkParser {
  /// Parse any incoming URI into the app's internal route format
  static String? parseRoute(Uri uri) {
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      return _parseWebUrl(uri);
    } else if (uri.scheme == 'productapp') {
      return _parseCustomScheme(uri);
    }
    return null;
  }

  /// Handle web-based deep links (App Links / Universal Links)
  static String? _parseWebUrl(Uri uri) {
    if (uri.host == Urls.ip) {
      // Match: https://domain/product/:id
      if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'product') {
        if (uri.pathSegments.length > 1) {
          final id = uri.pathSegments[1];
          return '/product/$id';
        }
      }
    }
    return null;
  }

  /// Handle custom scheme deep links
  static String? _parseCustomScheme(Uri uri) {
    // Example: productapp://product/prod1 -> /product/prod1
    if (uri.host == 'product' && uri.pathSegments.isNotEmpty) {
      return '/product/${uri.pathSegments[0]}';
    }
    return null;
  }
}
