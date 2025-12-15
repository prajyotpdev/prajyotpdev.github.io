import 'package:flutter/cupertino.dart';

class ScreenUtil {
  static ScreenUtil? _instance;
  double _screenWidth = 1080;
  double _screenHeight = 1920;
  bool allowFontScaling = false;

  ScreenUtil._();

  static ScreenUtil getInstance() {
    _instance ??= ScreenUtil._();
    return _instance!;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
  }

  double setWidth(num width) {
    return width * _screenWidth / 1080;
  }

  double setHeight(num height) {
    return height * _screenHeight / 1920;
  }
}

// Initialize in your widget: