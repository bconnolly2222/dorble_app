import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData defaultTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.white,
  )
);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    secondary: Colors.black,
  )
);



class ThemeProvider with ChangeNotifier {
  static late SharedPreferences theme;

  ThemeData _themeData = defaultTheme;

  static bool isSwitched = theme.getBool('bool') ?? false;
  
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  ThemeProvider() {
    init();
  }

  Future<void> init() async {
    theme = await SharedPreferences.getInstance();
    if (isSwitched == false) {
      themeData = defaultTheme;
    } else {
      themeData = lightTheme;
    }
  }

  void toggleTheme() {
    if (_themeData == defaultTheme) {
      themeData = lightTheme;
      theme.setBool('bool', isSwitched);
    } else {
      themeData = defaultTheme;
      theme.setBool('bool', isSwitched);
    }
  
    if (answerIndicatorIndex == 1 && displayAnswer != "") {
      displayAnswerColor = themeData.colorScheme.secondary;
    }
    if (answerIndicatorRightIndex == 1 && displayRightAnswer != "") {
      displayRightColor = themeData.colorScheme.secondary;
    }
    if (answerIndicatorUnIndex == 1 && displayUnanswer != "") {
      displayUncolor = themeData.colorScheme.secondary;
    }
    if (answerIndicatorUnRightIndex == 1 && displayUnRightanswer != "") {
      displayUnRightcolor = themeData.colorScheme.secondary;
    }
  }
}