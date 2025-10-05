import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:flutter/material.dart';

//Daily Stats
class DailyStats with ChangeNotifier{
    int gamesPlayed = 0;
    int guesses = 0;
    int gamesWon = 0;
    double winPercentage = 0;
    double averageGuesses = 0.0;
    int winStreak = 0;

    void gamesPlayedCounter() {
        if (index == 7 && indexRight != 7) {
            guesses = guesses + indexRight + 1;
            gamesPlayed ++;
        } else if (indexRight == 7 && index != 7) {
            guesses = guesses + index + 1;
            gamesPlayed ++;
        }
        winPercentage = double.parse(((gamesWon / gamesPlayed) * 100).toStringAsFixed(1));
        averageGuesses = double.parse((guesses / gamesPlayed).toStringAsFixed(1));
        notifyListeners();
    }
    void gameWon() {
        gamesWon ++;
        winStreak ++;
        notifyListeners();
    }
    void lostStreak(){
        winStreak = 0;
        notifyListeners();
    }
}

//Unlimted stats
class UnlimitedStats with ChangeNotifier{
    int gamesPlayedUn = 0;
    int guessesUn = 0;
    int gamesWonUn = 0;
    double winPercentageUn = 0;
    double averageGuessesUn = 0.0;
    int winStreakUn = 0;

    void gamesPlayedCounter() {
        if (indexUn == 7 && indexUnRight != 7) {
            guessesUn = guessesUn + indexUnRight + 1;
            gamesPlayedUn ++;
        } else if (indexUnRight == 7 && indexUn != 7) {
            guessesUn = guessesUn + indexUn + 1;
            gamesPlayedUn ++;
        }
        winPercentageUn = double.parse(((gamesWonUn / gamesPlayedUn) * 100).toStringAsFixed(1));
        averageGuessesUn = double.parse((guessesUn / gamesPlayedUn).toStringAsFixed(1));
        notifyListeners();
    }
    void gameWon() {
        gamesWonUn ++;
        winStreakUn ++;
        notifyListeners();
    }
    void lostStreak(){
        winStreakUn = 0;
        notifyListeners();
    }
}