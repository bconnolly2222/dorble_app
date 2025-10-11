import 'package:dorble/Layouts/dorble_grid.dart';
import 'package:dorble/Variables/stats.dart';
import 'package:dorble/word_database.dart';
import 'package:flutter/material.dart';
import 'package:dorble/Variables/list_variables.dart';
import 'package:provider/provider.dart';

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
        default:
          return;
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
    });
  }

  //function to handle key taps - right grid
  void tappedRight(String input) {
    setState(() {
      //set row based on index
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
          return;
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
          // All attempts used, handle game over condition
          gameoverIndicatorDaily();
          answerIndicatorDaily();
          answerIndicatorRight();
          correctWordDaily = 0;
          Provider.of<DailyStats>(context, listen: false).lostStreak();
          Provider.of<DailyStats>(context, listen: false).gamesPlayedCounter();
          index = 7; // Set index to a value that prevents further input
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
          return;
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
    });
  }

  //function to backspace - left grid
  void backspaceRight () {
    setState(() {
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
          return;
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

  // Function to build a styled container for each key
  Widget buildStyledContainer(String label, List color) {
    return GestureDetector(
      onTap: () {
        tapped(label);
        tappedRight(label);
      },
      child: Container(
        width: 40,
        height: 70,
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
    return Padding(padding: const EdgeInsets.only(bottom: 40),
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
                  width: 60,
                  height: 70,
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
                  backspaceRight();
                },
                child: Container(
                  width: 60,
                  height: 70,
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
    Future.delayed(const Duration(seconds: 2), () {
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
          content: Text('You solved this DORBLE!'),
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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Completed!'),
        content: Text('You have already completed today\'s Daily Dorble. Come back tomorrow for a new challenge! Today\'s solutions: ${answer.toUpperCase()} and ${answerRight.toUpperCase()}'),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 28,
                  width: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              SizedBox(
                width: 44,
              ),
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
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGrid(),
              SizedBox(
                width: 15,
                height: 5,
              ),
              dorbleGridRight(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                //left answer
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
              SizedBox(
                height: 10,
                width: 115,
              ),
              Center(
                //right answer
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
            ]
          ),
          SizedBox(
            height: 200,
            width: 40,
          ),
          Center(
            child: keyboard(),
          ),
        ],
      ),
    );
  }
}