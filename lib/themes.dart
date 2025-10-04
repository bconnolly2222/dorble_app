import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:flutter/material.dart';

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

bool isSwitched = false;


class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = defaultTheme;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == defaultTheme) {
      themeData = lightTheme;
    } else {
      themeData = defaultTheme;
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