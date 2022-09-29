import 'package:flutter/foundation.dart';

void showLoadingProgress(received, total) {
  if (total != -1) {
    if (kDebugMode) {
      debugPrint('${(received / total * 100).toStringAsFixed(0)}%');
    }
  }
}
