import 'package:deeplinking_project/feature/home/data/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class ShareService {
  static void shareProduct(ProductModel product) {
    final message =
        "Check out this ${product.name}!\n\n"
        "App Link: ${product.deepLink}\n"
        "Web Link: ${product.universalLink}";

    SharePlus.instance.share(ShareParams(text: message, subject: 'Check out this product!'));
  }

  static void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
