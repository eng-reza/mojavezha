import 'package:flutter/material.dart';

class TextScalerUtil {
  /// مقدار واقعی TextScale از سیستم را می‌گیرد
  static double _getRawScale(BuildContext context) {
    return MediaQuery.textScalerOf(context).scale(1.0);
  }

  /// محدود کردن TextScale برای جلوگیری از به‌هم‌ریختگی UI
  static double _clampScale(double scale, double min, double max) {
    return scale.clamp(min, max);
  }

  /// تابع اصلی که همه جا استفاده می‌کنی
  static double getScaledFont(
    BuildContext context, {
    required double base,
    double minScale = 1.0,
    double maxScale = 1.3,
  }) {
    final raw = _getRawScale(context);
    final clamped = _clampScale(raw, minScale, maxScale);
    return base * clamped;
  }
}
