import 'package:app_master_class/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeMode theme;

  ThemeViewModel(this.theme) {
    _changeStatusBar();
  }

  changeTheme() {
    theme = theme == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _changeStatusBar();
    notifyListeners();
  }

  _changeStatusBar() {
    if (theme == ThemeMode.light) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: lightTheme().backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: darkTheme().backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
  }
}
