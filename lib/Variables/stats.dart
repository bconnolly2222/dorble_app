import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Daily Stats
class DailyStats with ChangeNotifier{
  static late SharedPreferences dailyStats;

  int gamesPlayed = dailyStats.getInt('gamesPlayed') ?? 0;
  int guesses = dailyStats.getInt('guesses') ?? 0;
  double winPercentage = dailyStats.getDouble('winPercentage') ?? 0;
  double averageGuesses = dailyStats.getDouble('averageGuesses') ?? 0;
  int gamesWon = dailyStats.getInt('gamesWon') ?? 0;
  int winStreak = dailyStats.getInt('winStreak') ?? 0;

  static Future<void> init() async {
    dailyStats = await SharedPreferences.getInstance();
  }

  void clearSharedPref() {
    dailyStats.clear();
    gamesPlayed = 0;
    guesses = 0;
    gamesWon = 0;
    winPercentage = 0;
    averageGuesses = 0;
    winStreak = 0;
    notifyListeners();
  }

  void gamesPlayedCounter() {
    if (index == 7 && indexRight != 7 && countedGame == false) {
      guesses = guesses + indexRight + 1;
      dailyStats.setInt('guesses', guesses);
      gamesPlayed ++;
      dailyStats.setInt('gamesPlayed', gamesPlayed);
      winPercentage = double.parse(((gamesWon / gamesPlayed) * 100).toStringAsFixed(1));
      dailyStats.setDouble('winPercentage', winPercentage);
      averageGuesses = double.parse((guesses / gamesPlayed).toStringAsFixed(1));
      dailyStats.setDouble('averageGuesses', averageGuesses);
      countedGame = true;
    } else if (indexRight == 7 && index != 7 && countedGame == false) {
      guesses = guesses + index + 1;
      dailyStats.setInt('guesses', guesses);
      gamesPlayed ++;
      dailyStats.setInt('gamesPlayed', gamesPlayed);
      winPercentage = double.parse(((gamesWon / gamesPlayed) * 100).toStringAsFixed(1));
      dailyStats.setDouble('winPercentage', winPercentage);
      averageGuesses = double.parse((guesses / gamesPlayed).toStringAsFixed(1));
      dailyStats.setDouble('averageGuesses', averageGuesses);
      countedGame = true;
    }
    notifyListeners();
  }

  void gameWon() {
    gamesWon ++;
    dailyStats.setInt('gamesWon', gamesWon);
    winStreak ++;
    dailyStats.setInt('winStreak', winStreak);
    notifyListeners();
  }

  void lostStreak(){
    winStreak = 0;
    dailyStats.setInt('winStreak', winStreak);
    notifyListeners();
  }
}

//Unlimted stats
class UnlimitedStats with ChangeNotifier{
  static late SharedPreferences unStats;

  int gamesPlayedUn = unStats.getInt('gamesPlayedUn') ?? 0;
  int guessesUn = unStats.getInt('guessesUn') ?? 0;
  double winPercentageUn = unStats.getDouble('winPercentageUn') ?? 0;
  double averageGuessesUn = unStats.getDouble('averageGuessesUn') ?? 0;
  int gamesWonUn = unStats.getInt('gamesWonUn') ?? 0;
  int winStreakUn = unStats.getInt('winStreakUn') ?? 0;

  static Future init() async {
    unStats = await SharedPreferences.getInstance();
  }

  void clearSharedPref() {
    unStats.clear();
    gamesPlayedUn = 0;
    guessesUn = 0;
    gamesWonUn = 0;
    winPercentageUn = 0;
    averageGuessesUn = 0;
    winStreakUn = 0;
    notifyListeners();
  }

  void gamesPlayedCounter() {
    if (indexUn == 7 && indexUnRight != 7 && countedGameUn == false) {
      guessesUn = guessesUn + indexUnRight + 1;
      unStats.setInt('guessesUn', guessesUn);
      gamesPlayedUn ++;
      unStats.setInt('gamesPlayedUn', gamesPlayedUn);
      winPercentageUn = double.parse(((gamesWonUn / gamesPlayedUn) * 100).toStringAsFixed(1));
      unStats.setDouble('winPercentageUn', winPercentageUn);
      averageGuessesUn = double.parse((guessesUn / gamesPlayedUn).toStringAsFixed(1));
      unStats.setDouble('averageGuessesUn', averageGuessesUn);
      countedGameUn = true;
    } else if (indexUnRight == 7 && indexUn != 7 && countedGameUn == false) {
      guessesUn = guessesUn + indexUn + 1;
      unStats.setInt('guessesUn', guessesUn);
      gamesPlayedUn ++;
      unStats.setInt('gamesPlayedUn', gamesPlayedUn);
      winPercentageUn = double.parse(((gamesWonUn / gamesPlayedUn) * 100).toStringAsFixed(1));
      unStats.setDouble('winPercentageUn', winPercentageUn);
      averageGuessesUn = double.parse((guessesUn / gamesPlayedUn).toStringAsFixed(1));
      unStats.setDouble('averageGuessesUn', averageGuessesUn);
      countedGameUn = true;
    }
    notifyListeners();
  }

  void gameWon() {
    gamesWonUn ++;
    unStats.setInt('gamesWonUn', gamesWonUn);
    winStreakUn ++;
    unStats.setInt('winStreakUn', winStreakUn);
    notifyListeners();
  }
  void lostStreak() {
    winStreakUn = 0;
    unStats.setInt('winStreakUn', winStreakUn);
    notifyListeners();
  }
}