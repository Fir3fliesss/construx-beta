/*
* File : App Theme Notifier (Listener)
* Version : 1.0.0
* */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:construx_beta/app/modules/helper/utils/language.dart';
import 'package:construx_beta/app/modules/helper/storage/local_storage.dart';
import 'package:construx_beta/app/modules/helper/theme/app_style.dart';
import 'package:construx_beta/app/modules/helper/widgets/my.dart';

import 'theme_customizer.dart';

class AppNotifier extends ChangeNotifier {
  AppNotifier();

  Future<void> init() async {
    _changeTheme();
    notifyListeners();
  }

  updateTheme(ThemeCustomizer themeCustomizer) {
    _changeTheme();

    notifyListeners();

    LocalStorage.setCustomizer(themeCustomizer);
  }

  Future<void> updateInStorage(ThemeCustomizer themeCustomizer) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("theme_customizer", themeCustomizer.toJSON());
  }

  void changeDirectionality(TextDirection textDirection, [bool notify = true]) {
    AppTheme.textDirection = textDirection;
    My.setTextDirection(textDirection);

    if (notify) notifyListeners();
  }

  Future<void> changeLanguage(Language language,
      {bool notify = true, bool changeDirection = true}) async {
    if (changeDirection) {
      if (language.supportRTL) {
        changeDirectionality(TextDirection.rtl, false);
      } else {
        changeDirectionality(TextDirection.ltr, false);
      }
    }

    await ThemeCustomizer.changeLanguage(language);

    if (notify) notifyListeners();
  }

  void _changeTheme() {
    AppTheme.theme = AppTheme.getThemeFromThemeMode();
    AppStyle.changeMyTheme();
  }
}
