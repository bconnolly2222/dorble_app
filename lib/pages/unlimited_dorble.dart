import 'package:dorble/Variables/stats.dart';
import 'package:dorble/database.dart';
import 'package:dorble/word_database.dart';
import 'package:flutter/material.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class UnlimitedDorble extends StatefulWidget {
  const UnlimitedDorble({super.key});

  @override
  State<UnlimitedDorble> createState() => _UnlimitedDorbleState();
}


class _UnlimitedDorbleState extends State<UnlimitedDorble> {

  //function to handle key taps
  void tappedUn(String input) {
    setState(() {
      //set row based on indexUn - left grid
      switch (indexUn) {
        case 0:
          xUn = row1Un;
          break;
        case 1:
          xUn = row2Un;
          break;
        case 2:
          xUn = row3Un;
          break;
        case 3:
          xUn = row4Un;
          break;
        case 4:
          xUn = row5Un;
          break;
        case 5:
          xUn = row6Un;
          break;
        case 6:
          xUn = row7Un;
          break;
      }

      if (xUn[0] == "") {
        xUn[0] = input;
      } else if (xUn[1] == "") {
        xUn[1] = input;
      } else if (xUn[2] == "") {
        xUn[2] = input;
      } else if (xUn[3] == "") {
        xUn[3] = input;
      } else if (xUn[4] == "") {
        xUn[4] = input;
      }

      //right grid
      switch (indexUnRight) {
        case 0:
          rUn = row1RightUn;
          break;
        case 1:
          rUn = row2RightUn;
          break;
        case 2:
          rUn = row3RightUn;
          break;
        case 3:
          rUn = row4RightUn;
          break;
        case 4:
          rUn = row5RightUn;
          break;
        case 5:
          rUn = row6RightUn;
          break;
        case 6:
          rUn = row7RightUn;
          break;
      }

      if (rUn[0] == "") {
        rUn[0] = input;
      } else if (rUn[1] == "") {
        rUn[1] = input;
      } else if (rUn[2] == "") {
        rUn[2] = input;
      } else if (rUn[3] == "") {
        rUn[3] = input;
      } else if (rUn[4] == "") {
        rUn[4] = input;
      }
    });
  }

  //function to handle enter key press - left grid
  void enterPressedUn() {
    setState(() {

      //set row based on indexUn
      switch (indexUn) {
        case 0:
          xUn = row1Un;
          yUn = colorow1Un;

          //set map data
          List answerListUn = ["","","","",""];
          for (int m = 0; m < 5; m++) {
            answerListUn[m] = answerUn[m].toUpperCase();
          }
          //print(answerListUnRight);
          answermapUn = {};
          emptyanswerUn(answermapUn, answerListUn);
          //print(answermap);

          xmapUn = {};
          emptyUn(xmapUn, xUn);
          //print(xmapUn);
          break;
        case 1:
          xUn = row2Un;
          yUn = colorow2Un;
          xmapUn = {};
          emptyUn(xmapUn, xUn);
          break;
        case 2:
          xUn = row3Un;
          yUn = colorow3Un;
          xmapUn = {};
          emptyUn(xmapUn, xUn);
          break;
        case 3:
          xUn = row4Un;
          yUn = colorow4Un;
          xmapUn = {};
          emptyUn(xmapUn, xUn);
          break;
        case 4:
          xUn = row5Un;
          yUn = colorow5Un;
          xmapUn = {};
          emptyUn(xmapUn, xUn);
          break;
        case 5:
          xUn = row6Un;
          yUn = colorow6Un;
          xmapUn = {};
          emptyUn(xmapUn, xUn);
          break;
        case 6:
          xUn = row7Un;
          yUn = colorow7Un;
          xmapUn = {};
          emptyUn(xmapUn, xUn);
          break;
        default:
          return;
      }

      // check if all letters are filled
      if (xUn.contains("")) {
        // Not all letters are filled, do nothing
        return;

      //check if the word is valid
      } else if (!validWords.contains(xUn.join().toLowerCase())) {
        // Word is not valid, show a message
        invalidWordIndicator();
        return;

      //check if the word matches the answer
      } else if (xUn.join().toLowerCase() == answerUn) {
        // Word matches the answer, handle win condition
        yUn = [greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor];
          if (indexUn == 0) {
            colorow1Un = yUn;
          } else if (indexUn == 1) {
            colorow2Un = yUn;
          } else if (indexUn == 2) {
            colorow3Un = yUn;
          } else if (indexUn == 3) {
            colorow4Un = yUn;
          } else if (indexUn == 4) {
            colorow5Un = yUn;
          } else if (indexUn == 5) {
            colorow6Un = yUn;
          } else {
            colorow7Un = yUn;
          }
        keyboardcolorUn(xUn[0], greenBoxColor);
        keyboardcolorUn(xUn[1], greenBoxColor);
        keyboardcolorUn(xUn[2], greenBoxColor);
        keyboardcolorUn(xUn[3], greenBoxColor);
        keyboardcolorUn(xUn[4], greenBoxColor);
        correctIndicator();
        answerIndicatorUn();
        correctWord ++;
        if (correctWord == 2) {
          winningDialog(context);
          correctWord = 0;
          Provider.of<UnlimitedStats>(context, listen: false).gameWon();
          Provider.of<UnlimitedStats>(context, listen: false).gamesPlayedCounter();
          finishedGameUn = true;
          unlimited.setBool('finishedGameUn', true);
        }
        indexUn = 7; // Set indexUn to a value that prevents further input
        return;

      //Change boxUn color and move to nexUnt row
      } else {
        for (int i = 0; i < 5; i++) {
          if (xUn[i].toLowerCase() == answerUn[i]) {
            // Correct letter in the correct position
            // Change boxUn color to green
            yUn[i] = greenBoxColor;
            keyboardcolorUn(xUn[i], greenBoxColor);
            xmapUn[xUn[i]] += 1;
            for (int j = (i-1); j >= 0; j--) {
              if (xUn[j] == xUn[i] && yUn[j] != greenBoxColor && answermapUn[xUn[j]] < xmapUn[xUn[i]]) {
                yUn[j] = greyBoxColor;
                xmapUn[xUn[i]] -= 1;
              }
            }
          } else if (answerUn.contains(xUn[i].toLowerCase())) {
            // Correct letter in the wrong position
            // Change boxUn color to yellow
            yUn[i] = yellowBoxColor;
            keyboardcolorUn(xUn[i], yellowBoxColor);
            xmapUn[xUn[i]] += 1;
            for (int j = i; j >= 0; j--) {
              if (xUn[j] == xUn[i] && yUn[j] != greenBoxColor && answermapUn[xUn[j]] < xmapUn[xUn[i]]) {
                yUn[j] = greyBoxColor;
                xmapUn[xUn[i]] -= 1;
              }
            }
          } else {
            // Incorrect letter
            // Change boxUn color to grey
            yUn[i] = greyBoxColor;
            keyboardcolorGreyChangeUn(xUn[i], greyBoxColor);
          }
        }

        if (indexUn == 0) {
            colorow1Un = yUn;
          } else if (indexUn == 1) {
            colorow2Un = yUn;
          } else if (indexUn == 2) {
            colorow3Un = yUn;
          } else if (indexUn == 3) {
            colorow4Un = yUn;
          } else if (indexUn == 4) {
            colorow5Un = yUn;
          } else if (indexUn == 5) {
            colorow6Un = yUn;
          } else {
            colorow7Un = yUn;
          }

        if (indexUn < 6) {
          indexUn++;
        } else {
          //condition when left grid gameover but right grid correct
          if (correctWord == 1) {
            Provider.of<UnlimitedStats>(context, listen: false).gamesPlayedCounter();
          }
          // All attempts used, handle game over condition
          gameoverIndicator();
          answerIndicatorUn();
          answerIndicatorUnRight();
          correctWord = 0;
          indexUn = 7; // Set indexUn to a value that prevents further input
          Provider.of<UnlimitedStats>(context, listen: false).lostStreak();
          Provider.of<UnlimitedStats>(context, listen: false).gamesPlayedCounter();
          finishedGameUn = true;
          unlimited.setBool('finishedGameUn', true);
          return;
        }
      }
    });
  }

  //function to handle enter key press for the right grid
  void enterPressedUnRight() {
    setState(() {

      //set row based on indexUn
      switch (indexUnRight) {
        case 0:
          rUn = row1RightUn;
          yUn = colorow1RightUn;

          //set map data
          List answerListUnRight = ["","","","",""];
          for (int m = 0; m < 5; m++) {
            answerListUnRight[m] = answerUnRight[m].toUpperCase();
          }
          //print(answerListUnRight);
          answermapUnRight = {};
          emptyanswerUn(answermapUnRight, answerListUnRight);
          //print(answermap);

          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          //print(xmapUn);
          break;
        case 1:
          rUn = row2RightUn;
          yUn = colorow2RightUn;
          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          break;
        case 2:
          rUn = row3RightUn;
          yUn = colorow3RightUn;
          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          break;
        case 3:
          rUn = row4RightUn;
          yUn = colorow4RightUn;
          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          break;
        case 4:
          rUn = row5RightUn;
          yUn = colorow5RightUn;
          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          break;
        case 5:
          rUn = row6RightUn;
          yUn = colorow6RightUn;
          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          break;
        case 6:
          rUn = row7RightUn;
          yUn = colorow7RightUn;
          xmapUnRight = {};
          emptyUn(xmapUnRight, rUn);
          break;
        default:
          return;
      }

      // check if all letters are filled
      if (rUn.contains("")) {
        // Not all letters are filled, do nothing
        return;

      //check if the word is valid
      } else if (!validWords.contains(rUn.join().toLowerCase())) {
        // Word is not valid, show a message
        invalidWordIndicator();
        return;

      //check if the word matches the answer
      } else if (rUn.join().toLowerCase() == answerUnRight) {
        // Word matches the answer, handle win condition
        yUn = [greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor];
          if (indexUnRight == 0) {
            colorow1RightUn = yUn;
          } else if (indexUnRight == 1) {
            colorow2RightUn = yUn;
          } else if (indexUnRight == 2) {
            colorow3RightUn = yUn;
          } else if (indexUnRight == 3) {
            colorow4RightUn = yUn;
          } else if (indexUnRight == 4) {
            colorow5RightUn = yUn;
          } else if (indexUnRight == 5) {
            colorow6RightUn = yUn;
          } else {
            colorow7RightUn = yUn;
          }
        keyboardcolorUn(rUn[0], greenBoxColor);
        keyboardcolorUn(rUn[1], greenBoxColor);
        keyboardcolorUn(rUn[2], greenBoxColor);
        keyboardcolorUn(rUn[3], greenBoxColor);
        keyboardcolorUn(rUn[4], greenBoxColor);
        correctIndicator();
        if (countedGameUn == true) {
          gameoverIndicator();
        }
        answerIndicatorUnRight();
        correctWord ++;
        if (correctWord == 2) {
          winningDialog(context);
          correctWord = 0;
          Provider.of<UnlimitedStats>(context, listen: false).gameWon();
          Provider.of<UnlimitedStats>(context, listen: false).gamesPlayedCounter();
          finishedGameUn = true;
          unlimited.setBool('finishedGameUn', true);
        }
        indexUnRight = 7; // Set indexUn to a value that prevents further input
        return;

      //Change boxUn color and move to nexUnt row
      } else {
        for (int i = 0; i < 5; i++) {
          if (rUn[i].toLowerCase() == answerUnRight[i]) {
            // Correct letter in the correct position
            // Change boxUn color to green
            yUn[i] = greenBoxColor;
            keyboardcolorUn(rUn[i], greenBoxColor);
            xmapUnRight[rUn[i]] += 1;
            for (int j = (i-1); j >= 0; j--) {
              if (rUn[j] == rUn[i] && yUn[j] != greenBoxColor && answermapUnRight[rUn[j]] < xmapUnRight[rUn[i]]) {
                yUn[j] = greyBoxColor;
                xmapUnRight[rUn[i]] -= 1;
              }
            }
          } else if (answerUnRight.contains(rUn[i].toLowerCase())) {
            // Correct letter in the wrong position
            // Change boxUn color to yellow
            yUn[i] = yellowBoxColor;
            keyboardcolorUn(rUn[i], yellowBoxColor);
            xmapUnRight[rUn[i]] += 1;
            for (int j = i; j >= 0; j--) {
              if (rUn[j] == rUn[i] && yUn[j] != greenBoxColor && answermapUnRight[rUn[j]] < xmapUnRight[rUn[i]]) {
                yUn[j] = greyBoxColor;
                xmapUnRight[rUn[i]] -= 1;
              }
            }
          } else {
            // Incorrect letter
            // Change boxUn color to grey
            yUn[i] = greyBoxColor;
            keyboardcolorGreyChangeUn(rUn[i], greyBoxColor);
          }
        }

        if (indexUnRight == 0) {
            colorow1RightUn = yUn;
          } else if (indexUnRight == 1) {
            colorow2RightUn = yUn;
          } else if (indexUnRight == 2) {
            colorow3RightUn = yUn;
          } else if (indexUnRight == 3) {
            colorow4RightUn = yUn;
          } else if (indexUnRight == 4) {
            colorow5RightUn = yUn;
          } else if (indexUnRight == 5) {
            colorow6RightUn = yUn;
          } else {
            colorow7RightUn = yUn;
          }

        if (indexUnRight < 6) {
          indexUnRight++;
        } else {
          // All attempts used, handle game over condition
          gameoverIndicator();
          answerIndicatorUn();
          answerIndicatorUnRight();
          correctWord = 0;
          Provider.of<UnlimitedStats>(context, listen: false).lostStreak();
          Provider.of<UnlimitedStats>(context, listen: false).gamesPlayedCounter();
          indexUnRight = 7; // Set indexUn to a value that prevents further input
          finishedGameUn = true;
          unlimited.setBool('finishedGameUn', true);
          return;
        }
      }
    });
  }

  //function to backspace
  void backspaceUn () {
    setState(() {
      //set row based on indexUn - left grid
      switch (indexUn) {
        case 0:
          xUn = row1Un;
          break;
        case 1:
          xUn = row2Un;
          break;
        case 2:
          xUn = row3Un;
          break;
        case 3:
          xUn = row4Un;
          break;
        case 4:
          xUn = row5Un;
          break;
        case 5:
          xUn = row6Un;
          break;
        case 6:
          xUn = row7Un;
          break;
        default:
          xUn = ["","","","",""];
      }

      // Remove the last letter in the current row
      if (xUn[4] != "") {
        xUn[4] = "";
      } else if (xUn[3] != "") {
        xUn[3] = "";
      } else if (xUn[2] != "") {
        xUn[2] = "";
      } else if (xUn[1] != "") {
        xUn[1] = "";
      } else if (xUn[0] != "") {
        xUn[0] = "";
      }
      displayUn = "";
      displayColorUn = Colors.transparent;

      //right grid
      switch (indexUnRight) {
        case 0:
          rUn = row1RightUn;
          break;
        case 1:
          rUn = row2RightUn;
          break;
        case 2:
          rUn = row3RightUn;
          break;
        case 3:
          rUn = row4RightUn;
          break;
        case 4:
          rUn = row5RightUn;
          break;
        case 5:
          rUn = row6RightUn;
          break;
        case 6:
          rUn = row7RightUn;
          break;
        default:
          rUn = ["","","","",""];
      }

      // Remove the last letter in the current row
      if (rUn[4] != "") {
        rUn[4] = "";
      } else if (rUn[3] != "") {
        rUn[3] = "";
      } else if (rUn[2] != "") {
        rUn[2] = "";
      } else if (rUn[1] != "") {
        rUn[1] = "";
      } else if (rUn[0] != "") {
        rUn[0] = "";
      }
    });
  }

  //function to build the dorble grid containers
  Widget dorbleGridContainer(String input, List color) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.08,
            height: screenWidth * 0.08,
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, color[0], color[1], color[2]),
              border: Border.all(color: const Color.fromARGB(255, 100, 98, 98)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(input,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  //function to build the dorble grid layout - left
  Widget dorbleGridUn() {
    return Padding(padding: const EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row1Un[0], colorow1Un[0]),
              dorbleGridContainer(row1Un[1], colorow1Un[1]),
              dorbleGridContainer(row1Un[2], colorow1Un[2]),
              dorbleGridContainer(row1Un[3], colorow1Un[3]),
              dorbleGridContainer(row1Un[4], colorow1Un[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row2Un[0], colorow2Un[0]),
              dorbleGridContainer(row2Un[1], colorow2Un[1]),
              dorbleGridContainer(row2Un[2], colorow2Un[2]),
              dorbleGridContainer(row2Un[3], colorow2Un[3]),
              dorbleGridContainer(row2Un[4], colorow2Un[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row3Un[0], colorow3Un[0]),
              dorbleGridContainer(row3Un[1], colorow3Un[1]),
              dorbleGridContainer(row3Un[2], colorow3Un[2]),
              dorbleGridContainer(row3Un[3], colorow3Un[3]),
              dorbleGridContainer(row3Un[4], colorow3Un[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row4Un[0], colorow4Un[0]),
              dorbleGridContainer(row4Un[1], colorow4Un[1]),
              dorbleGridContainer(row4Un[2], colorow4Un[2]),
              dorbleGridContainer(row4Un[3], colorow4Un[3]),
              dorbleGridContainer(row4Un[4], colorow4Un[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row5Un[0], colorow5Un[0]),
              dorbleGridContainer(row5Un[1], colorow5Un[1]),
              dorbleGridContainer(row5Un[2], colorow5Un[2]),
              dorbleGridContainer(row5Un[3], colorow5Un[3]),
              dorbleGridContainer(row5Un[4], colorow5Un[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row6Un[0], colorow6Un[0]),
              dorbleGridContainer(row6Un[1], colorow6Un[1]),
              dorbleGridContainer(row6Un[2], colorow6Un[2]),
              dorbleGridContainer(row6Un[3], colorow6Un[3]),
              dorbleGridContainer(row6Un[4], colorow6Un[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row7Un[0], colorow7Un[0]),
              dorbleGridContainer(row7Un[1], colorow7Un[1]),
              dorbleGridContainer(row7Un[2], colorow7Un[2]),
              dorbleGridContainer(row7Un[3], colorow7Un[3]),
              dorbleGridContainer(row7Un[4], colorow7Un[4]),
            ],
          )
        ],
      ),
    );
  }

  //function to build the dorble grid layout - Right
  Widget dorbleGridUnRight() {
    return Padding(padding: const EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row1RightUn[0], colorow1RightUn[0]),
              dorbleGridContainer(row1RightUn[1], colorow1RightUn[1]),
              dorbleGridContainer(row1RightUn[2], colorow1RightUn[2]),
              dorbleGridContainer(row1RightUn[3], colorow1RightUn[3]),
              dorbleGridContainer(row1RightUn[4], colorow1RightUn[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row2RightUn[0], colorow2RightUn[0]),
              dorbleGridContainer(row2RightUn[1], colorow2RightUn[1]),
              dorbleGridContainer(row2RightUn[2], colorow2RightUn[2]),
              dorbleGridContainer(row2RightUn[3], colorow2RightUn[3]),
              dorbleGridContainer(row2RightUn[4], colorow2RightUn[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row3RightUn[0], colorow3RightUn[0]),
              dorbleGridContainer(row3RightUn[1], colorow3RightUn[1]),
              dorbleGridContainer(row3RightUn[2], colorow3RightUn[2]),
              dorbleGridContainer(row3RightUn[3], colorow3RightUn[3]),
              dorbleGridContainer(row3RightUn[4], colorow3RightUn[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row4RightUn[0], colorow4RightUn[0]),
              dorbleGridContainer(row4RightUn[1], colorow4RightUn[1]),
              dorbleGridContainer(row4RightUn[2], colorow4RightUn[2]),
              dorbleGridContainer(row4RightUn[3], colorow4RightUn[3]),
              dorbleGridContainer(row4RightUn[4], colorow4RightUn[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row5RightUn[0], colorow5RightUn[0]),
              dorbleGridContainer(row5RightUn[1], colorow5RightUn[1]),
              dorbleGridContainer(row5RightUn[2], colorow5RightUn[2]),
              dorbleGridContainer(row5RightUn[3], colorow5RightUn[3]),
              dorbleGridContainer(row5RightUn[4], colorow5RightUn[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row6RightUn[0], colorow6RightUn[0]),
              dorbleGridContainer(row6RightUn[1], colorow6RightUn[1]),
              dorbleGridContainer(row6RightUn[2], colorow6RightUn[2]),
              dorbleGridContainer(row6RightUn[3], colorow6RightUn[3]),
              dorbleGridContainer(row6RightUn[4], colorow6RightUn[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row7RightUn[0], colorow7RightUn[0]),
              dorbleGridContainer(row7RightUn[1], colorow7RightUn[1]),
              dorbleGridContainer(row7RightUn[2], colorow7RightUn[2]),
              dorbleGridContainer(row7RightUn[3], colorow7RightUn[3]),
              dorbleGridContainer(row7RightUn[4], colorow7RightUn[4]),
            ],
          )
        ],
      ),
    );
  }

  // Function to build a styled container for each key
  Widget buildStyledContainerUn(String label, List color) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return GestureDetector(
      onTap: () {
        tappedUn(label);
      },
      child: Container(
        width: screenWidth * 0.086,
        height: screenHeight * 0.075,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, color[0], color[1], color[2]),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  //function to build the keyboard layout
  Widget keyboardUn() {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Padding(padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStyledContainerUn('Q', toprowUn[0]),
              buildStyledContainerUn('W', toprowUn[1]),
              buildStyledContainerUn('E', toprowUn[2]),
              buildStyledContainerUn('R', toprowUn[3]),
              buildStyledContainerUn('T', toprowUn[4]),
              buildStyledContainerUn('Y', toprowUn[5]),
              buildStyledContainerUn('U', toprowUn[6]),
              buildStyledContainerUn('I', toprowUn[7]),
              buildStyledContainerUn('O', toprowUn[8]),
              buildStyledContainerUn('P', toprowUn[9]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStyledContainerUn('A', middlerowUn[0]),
              buildStyledContainerUn('S', middlerowUn[1]),
              buildStyledContainerUn('D', middlerowUn[2]),
              buildStyledContainerUn('F', middlerowUn[3]),
              buildStyledContainerUn('G', middlerowUn[4]),
              buildStyledContainerUn('H', middlerowUn[5]),
              buildStyledContainerUn('J', middlerowUn[6]),
              buildStyledContainerUn('K', middlerowUn[7]),
              buildStyledContainerUn('L', middlerowUn[8]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //enter button
              GestureDetector(
                onTap: () {
                  enterPressedUn();
                  enterPressedUnRight();
                },
                child: Container(
                  width: screenWidth * 0.13,
                  height: screenHeight * 0.075,
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('ENTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              buildStyledContainerUn('Z', bottomrowUn[0]),
              buildStyledContainerUn('X', bottomrowUn[1]),
              buildStyledContainerUn('C', bottomrowUn[2]),
              buildStyledContainerUn('V', bottomrowUn[3]),
              buildStyledContainerUn('B', bottomrowUn[4]),
              buildStyledContainerUn('N', bottomrowUn[5]),
              buildStyledContainerUn('M', bottomrowUn[6]),
              //back button
              GestureDetector(
                onTap: () {
                  backspaceUn();
                },
                child: Container(
                  width: screenWidth * 0.13,
                  height: screenHeight * 0.075,
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.backspace,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ); 
  }

  //functions to display game messages
  void gameoverIndicator() {
    setState(() {
      displayUn = "GAME OVER";
      displayColorUn = Theme.of(context).colorScheme.secondary;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          displayUn = "";
          displayColorUn = Colors.transparent;
        });
      }
    });
  }

  void correctIndicator() {
    setState(() {
      displayUn = "NICE WORK!";
      displayColorUn = Theme.of(context).colorScheme.secondary;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          displayUn = "";
          displayColorUn = Colors.transparent;
        });
      }
    });
  }

  void answerIndicatorUn() {
    setState(() {
      displayUnanswer = answerUn.toUpperCase();
      displayUncolor = Theme.of(context).colorScheme.secondary;
      answerIndicatorUnIndex ++;
    });
  }

  void answerIndicatorUnRight() {
    setState(() {
      displayUnRightanswer = answerUnRight.toUpperCase();
      displayUnRightcolor = Theme.of(context).colorScheme.secondary;
      answerIndicatorUnRightIndex ++;
    });
  }

  void invalidWordIndicator () {
    setState(() {
      displayUn = "INVALID WORD";
      displayColorUn = Theme.of(context).colorScheme.secondary;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          displayUn = "";
          displayColorUn = Colors.transparent;
        });
      }
    });
  }

  void winningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You solved this DORBLE! Tap each word to see their definitions.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
  }

  //create new game
  void newGame() {
    setState(() {
      //generate new solutions
      randomIndex = random.nextInt(solutionList.length);
      answerUn = solutionList[randomIndex];
      unlimited.setString('answerUn', answerUn);

      randomIndex = random.nextInt(solutionList.length);
      answerUnRight = solutionList[randomIndex];
      unlimited.setString('answerUnRight', answerUnRight);

      finishedGameUn = false;
      unlimited.setBool('finishedGameUn', false);

      countedGameUn = false;

      // Lists to hold the keyUnboard layUnout
      row1Un = ["", "", "", "" ,""];
      row2Un = ["", "", "", "" ,""];
      row3Un = ["", "", "", "" ,""];
      row4Un = ["", "", "", "" ,""];
      row5Un = ["", "", "", "" ,""];
      row6Un = ["", "", "", "" ,""];
      row7Un = ["", "", "", "" ,""];

      row1RightUn = ["", "", "", "" ,""];
      row2RightUn = ["", "", "", "" ,""];
      row3RightUn = ["", "", "", "" ,""];
      row4RightUn = ["", "", "", "" ,""];
      row5RightUn = ["", "", "", "" ,""];
      row6RightUn = ["", "", "", "" ,""];
      row7RightUn = ["", "", "", "" ,""];

      colorow1Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow2Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow3Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow4Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow5Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow6Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow7Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];

      colorow1RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow2RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow3RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow4RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow5RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow6RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow7RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];

      //Variables for logic - DAILY DORBLE
      xUn = []; //iterates row for letter
      yUn = []; //iterates row for color
      rUn = []; //iterates row for right grid color
      indexUn = 0;
      indexUnRight = 0;

      //map functions
      answermapUn = {};
      answermapUnRight = {};
      xmapUn = {};
      xmapUnRight = {};

      //display indicator variables
      //top indicator
      displayUn = "";
      displayColorUn = Colors.transparent;

      //answer indicator
      displayUnRightanswer = "";
      displayUnRightcolor = Colors.transparent;
      displayUnanswer = "";
      displayUncolor = Colors.transparent;

      //index for theme switch
      answerIndicatorUnIndex = 0;
      answerIndicatorUnRightIndex = 0;

      //game win - both words right
      correctWord = 0;

      //keyboard coloring
      toprowUn = [defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor];
      middlerowUn = [defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor];
      bottomrowUn = [defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor];
    });
  }
  
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  
  @override
  void initState() {
    super.initState();
    loadBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
  }

  void loadBannerAd() {
    final String adUnitId = testAdUnitId; // Test Ad Unit ID

    final BannerAd banner = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, LoadAdError error) {
          ad.dispose();
        },
      ),
    );
    banner.load();
  }

  Future<Map> fetchDef(String answer) async {
    // Simulate a network call to fetch the definition
    final response = await http.get(Uri.parse('https://www.merriam-webster.com/dictionary/$answer'));
    if (response.statusCode == 200) {
      final doc = parse(response.body);
      final title = doc.querySelector('h1')?.text ?? answer;
      final speech = doc.querySelector('h2')?.text ?? 'No Speech Found';
      final defs = doc.querySelector('.dtText')?.text ?? 'No Definition Found';

      final Map data = {
        'title': title,
        'speech': speech,
        'defs': defs,
      };
      return data;
    } else {
      throw Exception('Failed to load definition');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Unlimited Dorble',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    newGame();
                  },
                  child: Container(
                    height: 28,
                    width: 28,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  )
                ),
                Text("New Game",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )
                ),
                Expanded(child: SizedBox()),
                Center(
                  child: Container(
                    width: 130,
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: displayColorUn),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(displayUn,
                      style: TextStyle(
                        color: displayColorUn,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dorbleGridUn(),
                Expanded(child: SizedBox()),
                ColoredBox(
                  color: Colors.grey,
                  child: SizedBox(
                    width: 1,
                    height: screenWidth * 0.6,
                  ),
                ),
                Expanded(child: SizedBox()),
                dorbleGridUnRight(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                //left answer
                child: GestureDetector(
                  onTap: () {
                    if (finishedGameUn == false) {
                      return;
                    }
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: fetchDef(answerUn), 
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                  height: screenHeight * 0.5,
                                  width: screenWidth,
                                  color: Colors.black,
                                  child: Column(
                                    children: [
                                      Text(snapshot.data!['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                        ),
                                      ),
                                      Text(snapshot.data!['speech'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                        child: Text('DEFINITION${snapshot.data!['defs']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Padding(
                                        padding: const EdgeInsets.all(50),
                                        child: Text('Source: Merriam-Webster.com',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              );
                            } else {
                              return Container(
                                height: screenHeight * 0.5,
                                width: screenWidth,
                                color: Colors.black,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Text('Fetching definition...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: displayUncolor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(displayUnanswer,
                      style: TextStyle(
                        color: displayUncolor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                width: screenWidth * 0.24,
              ),
              Center(
                //right answer
                child: GestureDetector(
                  onTap: () {
                    if (finishedGameUn == false) {
                      return;
                    }
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: fetchDef(answerUnRight), 
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                  height: screenHeight * 0.5,
                                  width: screenWidth,
                                  color: Colors.black,
                                  child: Column(
                                    children: [
                                      Text(snapshot.data!['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                        ),
                                      ),
                                      Text(snapshot.data!['speech'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20, right: 20),
                                        child: Text('DEFINITION${snapshot.data!['defs']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Padding(
                                        padding: const EdgeInsets.all(50),
                                        child: Text('Source: Merriam-Webster.com',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              );
                            } else {
                              return Container(
                                height: screenHeight * 0.5,
                                width: screenWidth,
                                color: Colors.black,
                                child: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Text('Fetching definition...',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: displayUnRightcolor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(displayUnRightanswer,
                      style: TextStyle(
                        color: displayUnRightcolor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ]
          ),
          Expanded(child: SizedBox()),
          Center(
            child: keyboardUn(),
          ),
          if (showAds && _isAdLoaded && _bannerAd != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
          if (showAds == false || _isAdLoaded == false || _bannerAd == null)
            Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: SizedBox(
                height: 50,
              ),
            ),
        ],
      ),
    );
  }
}