import 'package:plants/resources/app_color.dart';
import 'package:plants/resources/drawable.dart';

class R {
  static void refreshClass() {
    _drawable = null;
  }

  static Drawable? _drawable;
  static Drawable get drawable => _drawable ??= Drawable();

  static AppColor? _appColor;
  static AppColor get appColor => _appColor ??= AppColor();
}
