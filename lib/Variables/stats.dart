import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Daily Stats
class DailyStats with ChangeNotifier{
  late SharedPreferences dailyStats;

  int gamesPlayed = 0;
  int guesses = 0;
  int gamesWon = 0;
  double winPercentage = 0;
  double averageGuesses = 0;
  int winStreak = 0;

  DailyStats() {
    init();
  }

  Future<void> init() async {
    dailyStats = await SharedPreferences.getInstance();
    //use to clear shared preferences instances data
    //await dailyStats.clear();
    gamesPlayed = dailyStats.getInt('gamesPlayed') ?? 0;
    guesses = dailyStats.getInt('guesses') ?? 0;
    gamesWon = dailyStats.getInt('gamesWon') ?? 0;
    winPercentage = dailyStats.getDouble('winPercentage') ?? 0;
    averageGuesses = dailyStats.getDouble('averageGuesses') ?? 0;
    winStreak = dailyStats.getInt('winStreak') ?? 0;
  }

  void gamesPlayedCounter() {
      if (index == 7 && indexRight != 7) {
          guesses = guesses + indexRight + 1;
          dailyStats.setInt('guesses', guesses);
          gamesPlayed ++;
          dailyStats.setInt('gamesPlayed', gamesPlayed);
      } else if (indexRight == 7 && index != 7) {
          guesses = guesses + index + 1;
          dailyStats.setInt('guesses', guesses);
          gamesPlayed ++;
          dailyStats.setInt('gamesPlayed', gamesPlayed);
      }
      winPercentage = double.parse(((gamesWon / gamesPlayed) * 100).toStringAsFixed(1));
      dailyStats.setDouble('winPercentage', winPercentage);
      averageGuesses = double.parse((guesses / gamesPlayed).toStringAsFixed(1));
      dailyStats.setDouble('averageGuesses', averageGuesses);
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
  late SharedPreferences unStats;

  int gamesPlayedUn = 0;
  int guessesUn = 0;
  int gamesWonUn = 0;
  double winPercentageUn = 0;
  double averageGuessesUn = 0;
  int winStreakUn = 0;

  UnlimitedStats() {
    init();
  }

  Future<void> init() async {
    unStats = await SharedPreferences.getInstance();
    //use to clear shared preferences instances data
    //await unStats.clear();
    gamesPlayedUn = unStats.getInt('gamesPlayedUn') ?? 0;
    guessesUn = unStats.getInt('guessesUn') ?? 0;
    gamesWonUn = unStats.getInt('gamesWonUn') ?? 0;
    winPercentageUn = unStats.getDouble('winPercentageUn') ?? 0;
    averageGuessesUn = unStats.getDouble('averageGuessesUn') ?? 0;
    winStreakUn = unStats.getInt('winStreakUn') ?? 0;
    notifyListeners();
  }

  void gamesPlayedCounter() {
      if (indexUn == 7 && indexUnRight != 7) {
          guessesUn = guessesUn + indexUnRight + 1;
          unStats.setInt('guessesUn', guessesUn);
          gamesPlayedUn ++;
          unStats.setInt('gamesPlayedUn', gamesPlayedUn);
      } else if (indexUnRight == 7 && indexUn != 7) {
          guessesUn = guessesUn + indexUn + 1;
          unStats.setInt('guessesUn', guessesUn);
          gamesPlayedUn ++;
          unStats.setInt('gamesPlayedUn', gamesPlayedUn);
      }
      winPercentageUn = double.parse(((gamesWonUn / gamesPlayedUn) * 100).toStringAsFixed(1));
      unStats.setDouble('winPercentageUn', winPercentageUn);
      averageGuessesUn = double.parse((guessesUn / gamesPlayedUn).toStringAsFixed(1));
      unStats.setDouble('averageGuessesUn', averageGuessesUn);
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