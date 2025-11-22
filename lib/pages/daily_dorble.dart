import 'package:dorble/Variables/stats.dart';
import 'package:dorble/database.dart';
import 'package:dorble/word_database.dart';
import 'package:flutter/material.dart';
import 'package:dorble/Variables/list_variables.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class DailyDorble extends StatefulWidget {
  const DailyDorble({super.key});

  @override
  State<DailyDorble> createState() => _DailyDorbleState();
}


class _DailyDorbleState extends State<DailyDorble> {


  //function to handle key taps
  void tapped(String input) {
    setState(() {
      //set row based on index
      switch (index) {
        case 0:
          x = row1;
          break;
        case 1:
          x = row2;
          break;
        case 2:
          x = row3;
          break;
        case 3:
          x = row4;
          break;
        case 4:
          x = row5;
          break;
        case 5:
          x = row6;
          break;
        case 6:
          x = row7;
          break;
      }

      if (x[0] == "") {
        x[0] = input;
      } else if (x[1] == "") {
        x[1] = input;
      } else if (x[2] == "") {
        x[2] = input;
      } else if (x[3] == "") {
        x[3] = input;
      } else if (x[4] == "") {
        x[4] = input;
      }

      //right grid
      switch (indexRight) {
        case 0:
          r = row1Right;
          break;
        case 1:
          r = row2Right;
          break;
        case 2:
          r = row3Right;
          break;
        case 3:
          r = row4Right;
          break;
        case 4:
          r = row5Right;
          break;
        case 5:
          r = row6Right;
          break;
        case 6:
          r = row7Right;
          break;
      }

      if (r[0] == "") {
        r[0] = input;
      } else if (r[1] == "") {
        r[1] = input;
      } else if (r[2] == "") {
        r[2] = input;
      } else if (r[3] == "") {
        r[3] = input;
      } else if (r[4] == "") {
        r[4] = input;
      }
    });
  }

  //function to handle enter key press - left grid
  void enterPressed() {
    setState(() {

      //set row based on index
      switch (index) {
        case 0:
          x = row1;
          y = colorow1;

          //set map data
          List answerList = ["","","","",""];
          for (int m = 0; m < 5; m++) {
            answerList[m] = answer[m].toUpperCase();
          }
          //print(answerList);
          answermap = {};
          emptyanswer(answermap, answerList);
          //print(answermap);
          
          xmap = {};
          empty(xmap, x);
          //print(xmap);
          break;
        case 1:
          x = row2;
          y = colorow2;
          xmap = {};
          empty(xmap, x);
          break;
        case 2:
          x = row3;
          y = colorow3;
          xmap = {};
          empty(xmap, x);
          break;
        case 3:
          x = row4;
          y = colorow4;
          xmap = {};
          empty(xmap, x);
          break;
        case 4:
          x = row5;
          y = colorow5;
          xmap = {};
          empty(xmap, x);
          break;
        case 5:
          x = row6;
          y = colorow6;
          xmap = {};
          empty(xmap, x);
          break;
        case 6:
          x = row7;
          y = colorow7;
          xmap = {};
          empty(xmap, x);
          break;
        default:
          return;
      }

      // check if all letters are filled
      if (x.contains("")) {
        // Not all letters are filled, do nothing
        return;

      //check if the word is valid
      } else if (!validWords.contains(x.join().toLowerCase())) {
        // Word is not valid, show a message
        invalidWordIndicatorDaily();
        return;

      //check if the word matches the answer
      } else if (x.join().toLowerCase() == answer) {
        // Word matches the answer, handle win condition
        y = [greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor];
          if (index == 0) {
            colorow1 = y;
          } else if (index == 1) {
            colorow2 = y;
          } else if (index == 2) {
            colorow3 = y;
          } else if (index == 3) {
            colorow4 = y;
          } else if (index == 4) {
            colorow5 = y;
          } else if (index == 5) {
            colorow6 = y;
          } else {
            colorow7 = y;
          }
        keyboardcolor(x[0], greenBoxColor);
        keyboardcolor(x[1], greenBoxColor);
        keyboardcolor(x[2], greenBoxColor);
        keyboardcolor(x[3], greenBoxColor);
        keyboardcolor(x[4], greenBoxColor);
        correctIndicatorDaily();
        answerIndicatorDaily();
        correctWordDaily ++;
        if (correctWordDaily == 2) {
          winningDialogDaily(context);
          correctWordDaily = 0;
          Provider.of<DailyStats>(context, listen: false).gameWon();
          Provider.of<DailyStats>(context, listen: false).gamesPlayedCounter();
          daily.setInt('index', 7);
          daily.setInt('indexRight', 7);
        }
        index = 7; // Set index to a value that prevents further input
        return;

      //Change box color and move to next row
      } else {
        for (int i = 0; i < 5; i++) {
          if (x[i].toLowerCase() == answer[i]) {
            // Correct letter in the correct position
            // Change box color to green
            y[i] = greenBoxColor;
            keyboardcolor(x[i], greenBoxColor);
            xmap[x[i]] += 1;
            for (int j = (i-1); j >= 0; j--) {
              if (x[j] == x[i] && y[j] != greenBoxColor && answermap[x[j]] < xmap[x[i]]) {
                y[j] = greyBoxColor;
                xmap[x[i]] -= 1;
              }
            }
          } else if (answer.contains(x[i].toLowerCase())) {
            // Correct letter in the wrong position
            // Change box color to yellow
            y[i] = yellowBoxColor;
            ///////////////////FIX THIS
            keyboardcolor(x[i], yellowBoxColor);
            xmap[x[i]] += 1;
            for (int j = i; j >= 0; j--) {
              if (x[j] == x[i] && y[j] != greenBoxColor && answermap[x[j]] < xmap[x[i]]) {
                y[j] = greyBoxColor;
                xmap[x[i]] -= 1;
              }
            }
          } else {
            // Incorrect letter
            // Change box color to grey
            y[i] = greyBoxColor;
            keyboardcolorGreyChange(x[i], greyBoxColor);
          }
        }

        if (index == 0) {
            colorow1 = y;
          } else if (index == 1) {
            colorow2 = y;
          } else if (index == 2) {
            colorow3 = y;
          } else if (index == 3) {
            colorow4 = y;
          } else if (index == 4) {
            colorow5 = y;
          } else if (index == 5) {
            colorow6 = y;
          } else {
            colorow7 = y;
          }

        if (index < 6) {
          index++;
        } else {
          //condition for left grid gameover but right grid correct
          if (correctWordDaily == 1) {
            Provider.of<DailyStats>(context, listen: false).gamesPlayedCounter();
          }
          // All attempts used, handle game over condition
          gameoverIndicatorDaily();
          answerIndicatorDaily();
          answerIndicatorRight();
          correctWordDaily = 0;
          index = 7; // Set index to a value that prevents further input
          Provider.of<DailyStats>(context, listen: false).lostStreak();
          Provider.of<DailyStats>(context, listen: false).gamesPlayedCounter();
          daily.setInt('index', 7);
          daily.setInt('indexRight', 7);
          return;
        }
      }
    });
  }

  //function to handle enter key press for the right grid
  void enterPressedRight() {
    setState(() {

      //set row based on index
      switch (indexRight) {
        case 0:
          r = row1Right;
          y = colorow1Right;

          //set map data
          List answerListRight = ["","","","",""];
          for (int m = 0; m < 5; m++) {
            answerListRight[m] = answerRight[m].toUpperCase();
          }
          //print(answerList);
          answermapRight = {};
          emptyanswer(answermapRight, answerListRight);
          //print(answermap);

          xmapRight = {};
          empty(xmapRight, r);
          //print(xmap);
          break;
        case 1:
          r = row2Right;
          y = colorow2Right;
          xmapRight = {};
          empty(xmapRight, r);
          break;
        case 2:
          r = row3Right;
          y = colorow3Right;
          xmapRight = {};
          empty(xmapRight, r);
          break;
        case 3:
          r = row4Right;
          y = colorow4Right;
          xmapRight = {};
          empty(xmapRight, r);
          break;
        case 4:
          r = row5Right;
          y = colorow5Right;
          xmapRight = {};
          empty(xmapRight, r);
          break;
        case 5:
          r = row6Right;
          y = colorow6Right;
          xmapRight = {};
          empty(xmapRight, r);
          break;
        case 6:
          r = row7Right;
          y = colorow7Right;
          xmapRight = {};
          empty(xmapRight, r);
          break;
        default:
          return;
      }

      // check if all letters are filled
      if (r.contains("")) {
        // Not all letters are filled, do nothing
        return;

      //check if the word is valid
      } else if (!validWords.contains(r.join().toLowerCase())) {
        // Word is not valid, show a message
        invalidWordIndicatorDaily();
        return;

      //check if the word matches the answer
      } else if (r.join().toLowerCase() == answerRight) {
        // Word matches the answer, handle win condition
        y = [greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor, greenBoxColor];
          if (indexRight == 0) {
            colorow1Right = y;
          } else if (indexRight == 1) {
            colorow2Right = y;
          } else if (indexRight == 2) {
            colorow3Right = y;
          } else if (indexRight == 3) {
            colorow4Right = y;
          } else if (indexRight == 4) {
            colorow5Right = y;
          } else if (indexRight == 5) {
            colorow6Right = y;
          } else {
            colorow7Right = y;
          }
        keyboardcolor(r[0], greenBoxColor);
        keyboardcolor(r[1], greenBoxColor);
        keyboardcolor(r[2], greenBoxColor);
        keyboardcolor(r[3], greenBoxColor);
        keyboardcolor(r[4], greenBoxColor);
        correctIndicatorDaily();
        if (countedGame == true) {
          gameoverIndicatorDaily();
        }
        answerIndicatorRight();
        correctWordDaily ++;
        if (correctWordDaily == 2) {
          winningDialogDaily(context);
          correctWordDaily = 0;
          Provider.of<DailyStats>(context, listen: false).gameWon();
          Provider.of<DailyStats>(context, listen: false).gamesPlayedCounter();
          daily.setInt('index', 7);
          daily.setInt('indexRight', 7);
        }
        indexRight = 7; // Set index to a value that prevents further input
        return;

      //Change box color and move to next row
      } else {
        for (int i = 0; i < 5; i++) {
          if (r[i].toLowerCase() == answerRight[i]) {
            // Correct letter in the correct position
            // Change box color to green
            y[i] = greenBoxColor;
            keyboardcolor(r[i], greenBoxColor);
            xmapRight[r[i]] += 1;
            for (int j = (i-1); j >= 0; j--) {
              if (r[j] == r[i] && y[j] != greenBoxColor && answermapRight[r[j]] < xmapRight[r[i]]) {
                y[j] = greyBoxColor;
                xmapRight[r[i]] -= 1;
              }
            }
          } else if (answerRight.contains(r[i].toLowerCase())) {
            // Correct letter in the wrong position
            // Change box color to yellow
            y[i] = yellowBoxColor;
            keyboardcolor(r[i], yellowBoxColor);
            xmapRight[r[i]] += 1;
            for (int j = i; j >= 0; j--) {
              if (r[j] == r[i] && y[j] != greenBoxColor && answermapRight[r[j]] < xmapRight[r[i]]) {
                y[j] = greyBoxColor;
                xmapRight[r[i]] -= 1;
              }
            }
          } else {
            // Incorrect letter
            // Change box color to grey
            y[i] = greyBoxColor;
            keyboardcolorGreyChange(r[i], greyBoxColor);
          }
        }

        if (indexRight == 0) {
            colorow1Right = y;
          } else if (indexRight == 1) {
            colorow2Right = y;
          } else if (indexRight == 2) {
            colorow3Right = y;
          } else if (indexRight == 3) {
            colorow4Right = y;
          } else if (indexRight == 4) {
            colorow5Right = y;
          } else if (indexRight == 5) {
            colorow6Right = y;
          } else {
            colorow7Right = y;
          }

        if (indexRight < 6) {
          indexRight++;
        } else {
          // All attempts used, handle game over condition
          gameoverIndicatorDaily();
          answerIndicatorDaily();
          answerIndicatorRight();
          correctWordDaily = 0;
          Provider.of<DailyStats>(context, listen: false).lostStreak();
          Provider.of<DailyStats>(context, listen: false).gamesPlayedCounter();
          indexRight = 7; // Set index to a value that prevents further input
          daily.setInt('index', 7);
          daily.setInt('indexRight', 7);
          return;
        }
      }
    });
  }

  //function to backspace - right grid
  void backspace() {
    setState(() {
      //set row based on index
      switch (index) {
        case 0:
          x = row1;
          break;
        case 1:
          x = row2;
          break;
        case 2:
          x = row3;
          break;
        case 3:
          x = row4;
          break;
        case 4:
          x = row5;
          break;
        case 5:
          x = row6;
          break;
        case 6:
          x = row7;
          break;
        default:
          x = ["", "", "", "", ""];
      }

      // Remove the last letter in the current row
      if (x[4] != "") {
        x[4] = "";
      } else if (x[3] != "") {
        x[3] = "";
      } else if (x[2] != "") {
        x[2] = "";
      } else if (x[1] != "") {
        x[1] = "";
      } else if (x[0] != "") {
        x[0] = "";
      }
      display = "";
      displayColor = Colors.transparent;

      //right grid
      switch (indexRight) {
        case 0:
          r = row1Right;
          break;
        case 1:
          r = row2Right;
          break;
        case 2:
          r = row3Right;
          break;
        case 3:
          r = row4Right;
          break;
        case 4:
          r = row5Right;
          break;
        case 5:
          r = row6Right;
          break;
        case 6:
          r = row7Right;
          break;
        default:
          r = ["", "", "", "", ""];
      }

      // Remove the last letter in the current row
      if (r[4] != "") {
        r[4] = "";
      } else if (r[3] != "") {
        r[3] = "";
      } else if (r[2] != "") {
        r[2] = "";
      } else if (r[1] != "") {
        r[1] = "";
      } else if (r[0] != "") {
        r[0] = "";
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
  Widget dorbleGrid() {
    return Padding(padding: const EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row1[0], colorow1[0]),
              dorbleGridContainer(row1[1], colorow1[1]),
              dorbleGridContainer(row1[2], colorow1[2]),
              dorbleGridContainer(row1[3], colorow1[3]),
              dorbleGridContainer(row1[4], colorow1[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row2[0], colorow2[0]),
              dorbleGridContainer(row2[1], colorow2[1]),
              dorbleGridContainer(row2[2], colorow2[2]),
              dorbleGridContainer(row2[3], colorow2[3]),
              dorbleGridContainer(row2[4], colorow2[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row3[0], colorow3[0]),
              dorbleGridContainer(row3[1], colorow3[1]),
              dorbleGridContainer(row3[2], colorow3[2]),
              dorbleGridContainer(row3[3], colorow3[3]),
              dorbleGridContainer(row3[4], colorow3[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row4[0], colorow4[0]),
              dorbleGridContainer(row4[1], colorow4[1]),
              dorbleGridContainer(row4[2], colorow4[2]),
              dorbleGridContainer(row4[3], colorow4[3]),
              dorbleGridContainer(row4[4], colorow4[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row5[0], colorow5[0]),
              dorbleGridContainer(row5[1], colorow5[1]),
              dorbleGridContainer(row5[2], colorow5[2]),
              dorbleGridContainer(row5[3], colorow5[3]),
              dorbleGridContainer(row5[4], colorow5[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row6[0], colorow6[0]),
              dorbleGridContainer(row6[1], colorow6[1]),
              dorbleGridContainer(row6[2], colorow6[2]),
              dorbleGridContainer(row6[3], colorow6[3]),
              dorbleGridContainer(row6[4], colorow6[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row7[0], colorow7[0]),
              dorbleGridContainer(row7[1], colorow7[1]),
              dorbleGridContainer(row7[2], colorow7[2]),
              dorbleGridContainer(row7[3], colorow7[3]),
              dorbleGridContainer(row7[4], colorow7[4]),
            ],
          )
        ],
      ),
    );
  }

  //function to build the dorble grid layout - right
  Widget dorbleGridRight() {
    return Padding(padding: const EdgeInsets.only(top: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row1Right[0], colorow1Right[0]),
              dorbleGridContainer(row1Right[1], colorow1Right[1]),
              dorbleGridContainer(row1Right[2], colorow1Right[2]),
              dorbleGridContainer(row1Right[3], colorow1Right[3]),
              dorbleGridContainer(row1Right[4], colorow1Right[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row2Right[0], colorow2Right[0]),
              dorbleGridContainer(row2Right[1], colorow2Right[1]),
              dorbleGridContainer(row2Right[2], colorow2Right[2]),
              dorbleGridContainer(row2Right[3], colorow2Right[3]),
              dorbleGridContainer(row2Right[4], colorow2Right[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row3Right[0], colorow3Right[0]),
              dorbleGridContainer(row3Right[1], colorow3Right[1]),
              dorbleGridContainer(row3Right[2], colorow3Right[2]),
              dorbleGridContainer(row3Right[3], colorow3Right[3]),
              dorbleGridContainer(row3Right[4], colorow3Right[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row4Right[0], colorow4Right[0]),
              dorbleGridContainer(row4Right[1], colorow4Right[1]),
              dorbleGridContainer(row4Right[2], colorow4Right[2]),
              dorbleGridContainer(row4Right[3], colorow4Right[3]),
              dorbleGridContainer(row4Right[4], colorow4Right[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row5Right[0], colorow5Right[0]),
              dorbleGridContainer(row5Right[1], colorow5Right[1]),
              dorbleGridContainer(row5Right[2], colorow5Right[2]),
              dorbleGridContainer(row5Right[3], colorow5Right[3]),
              dorbleGridContainer(row5Right[4], colorow5Right[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row6Right[0], colorow6Right[0]),
              dorbleGridContainer(row6Right[1], colorow6Right[1]),
              dorbleGridContainer(row6Right[2], colorow6Right[2]),
              dorbleGridContainer(row6Right[3], colorow6Right[3]),
              dorbleGridContainer(row6Right[4], colorow6Right[4]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridContainer(row7Right[0], colorow7Right[0]),
              dorbleGridContainer(row7Right[1], colorow7Right[1]),
              dorbleGridContainer(row7Right[2], colorow7Right[2]),
              dorbleGridContainer(row7Right[3], colorow7Right[3]),
              dorbleGridContainer(row7Right[4], colorow7Right[4]),
            ],
          )
        ],
      ),
    );
  }

  // Function to build a styled container for each key
  Widget buildStyledContainer(String label, List color) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return GestureDetector(
      onTap: () {
        tapped(label);
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
  Widget keyboard() {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;

    return Padding(padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStyledContainer('Q', toprow[0]),
              buildStyledContainer('W', toprow[1]),
              buildStyledContainer('E', toprow[2]),
              buildStyledContainer('R', toprow[3]),
              buildStyledContainer('T', toprow[4]),
              buildStyledContainer('Y', toprow[5]),
              buildStyledContainer('U', toprow[6]),
              buildStyledContainer('I', toprow[7]),
              buildStyledContainer('O', toprow[8]),
              buildStyledContainer('P', toprow[9]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildStyledContainer('A', middlerow[0]),
              buildStyledContainer('S', middlerow[1]),
              buildStyledContainer('D', middlerow[2]),
              buildStyledContainer('F', middlerow[3]),
              buildStyledContainer('G', middlerow[4]),
              buildStyledContainer('H', middlerow[5]),
              buildStyledContainer('J', middlerow[6]),
              buildStyledContainer('K', middlerow[7]),
              buildStyledContainer('L', middlerow[8]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //enter button
              GestureDetector(
                onTap: () {
                  enterPressed();
                  enterPressedRight();
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
              buildStyledContainer('Z', bottomrow[0]),
              buildStyledContainer('X', bottomrow[1]),
              buildStyledContainer('C', bottomrow[2]),
              buildStyledContainer('V', bottomrow[3]),
              buildStyledContainer('B', bottomrow[4]),
              buildStyledContainer('N', bottomrow[5]),
              buildStyledContainer('M', bottomrow[6]),
              //back button
              GestureDetector(
                onTap: () {
                  backspace();
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
  void gameoverIndicatorDaily() {
    setState(() {
      display = "GAME OVER";
      displayColor = Theme.of(context).colorScheme.secondary;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          display = "";
          displayColor = Colors.transparent;
        });
      }
    });
  }

  void correctIndicatorDaily() {
    setState(() {
      display = "NICE WORK!";
      displayColor = Theme.of(context).colorScheme.secondary;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          display = "";
          displayColor = Colors.transparent;
        });
      }
    });
  }

  void answerIndicatorDaily() {
    setState(() {
      displayAnswer = answer.toUpperCase();
      displayAnswerColor = Theme.of(context).colorScheme.secondary;
      answerIndicatorIndex ++;
    });
  }

  void answerIndicatorRight() {
    setState(() {
      displayRightAnswer = answerRight.toUpperCase();
      displayRightColor = Theme.of(context).colorScheme.secondary;
      answerIndicatorRightIndex ++;
    });
  }

  void invalidWordIndicatorDaily () {
    setState(() {
      display = "INVALID WORD";
      displayColor = Theme.of(context).colorScheme.secondary;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          display = "";
          displayColor = Colors.transparent;
        });
      }
    });
  }

  void winningDialogDaily(BuildContext context) {
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

  //function to update game daily
  void newGameDaily() {
    setState(() {

      countedGame = false;
      
      row1 = ["", "", "", "" ,""];
      row2 = ["", "", "", "" ,""];
      row3 = ["", "", "", "" ,""];
      row4 = ["", "", "", "" ,""];
      row5 = ["", "", "", "" ,""];
      row6 = ["", "", "", "" ,""];
      row7 = ["", "", "", "" ,""];

      row1Right = ["", "", "", "" ,""];
      row2Right = ["", "", "", "" ,""];
      row3Right = ["", "", "", "" ,""];
      row4Right = ["", "", "", "" ,""];
      row5Right = ["", "", "", "" ,""];
      row6Right = ["", "", "", "" ,""];
      row7Right = ["", "", "", "" ,""];

      colorow1 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow2 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow3 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow4 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow5 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow6 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow7 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];

      colorow1Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow2Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow3Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow4Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow5Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow6Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      colorow7Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
      //Variables for logic - DAILY DORBLE
      x = []; //iterates row for letter
      y = []; //iterates row for color
      r = []; //iterates row for right grid color
      index = 0;
      indexRight = 0;

      //map functions
      answermap = {};
      answermapRight = {};
      xmap = {};
      xmapRight = {};

      //top indicator
      display = "";
      displayColor = Colors.transparent;

      //answer indicator
      displayAnswer = "";
      displayAnswerColor = Colors.transparent;
      displayRightAnswer = "";
      displayRightColor = Colors.transparent;

      //index for theme switch
      answerIndicatorIndex = 0;
      answerIndicatorRightIndex = 0;

      //game win - both words right
      correctWordDaily = 0;


      toprow = [defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor];
      middlerow = [defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor];
      bottomrow = [defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor];
    });
  }

  @override
  void initState() {
    super.initState();
    loadBannerAd();
      if (index == 0 && indexRight == 0) {
        newGameDaily();
      }
      // Wait until the first frame is rendered
      WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index == 7 && indexRight == 7) {
        _showDialog();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Completed!'),
        content: Text('You have already completed today\'s Daily DORBLE! Come back tomorrow for a new challenge! Today\'s solutions: ${answer.toUpperCase()} and ${answerRight.toUpperCase()}'),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

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
        title: Text('Daily Dorble',
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
                  onTap: () {},
                  child: Container(
                    height: 28,
                    width: 28,
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(Icons.add,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  )
                ),
                Text("New game",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
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
                      border: Border.all(color: displayColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(display,
                      style: TextStyle(
                        color: displayColor,
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
                dorbleGrid(),
                Expanded(child: SizedBox()),
                ColoredBox(
                  color: Colors.grey,
                  child: SizedBox(
                    width: 1,
                    height: screenWidth * 0.6,
                  ),
                ),
                Expanded(child: SizedBox()),
                dorbleGridRight(),
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
                    if (countedGame == false) {
                      return;
                    }
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: fetchDef(answer), 
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
                      border: Border.all(color: displayAnswerColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(displayAnswer,
                      style: TextStyle(
                        color: displayAnswerColor,
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
                    if (countedGame == false) {
                      return;
                    }
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: fetchDef(answerRight), 
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
                      border: Border.all(color: displayRightColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(displayRightAnswer,
                      style: TextStyle(
                        color: displayRightColor,
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
            child: keyboard(),
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