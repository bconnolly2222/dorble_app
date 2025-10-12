import 'package:dorble/Layouts/dorble_gridunlimited.dart';
import 'package:dorble/Variables/stats.dart';
import 'package:dorble/database.dart';
import 'package:dorble/word_database.dart';
import 'package:flutter/material.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class UnlimitedDorble extends StatefulWidget {
  const UnlimitedDorble({super.key});

  @override
  State<UnlimitedDorble> createState() => _UnlimitedDorbleState();
}


class _UnlimitedDorbleState extends State<UnlimitedDorble> {


  //function to handle key taps
  void tappedUn(String input) {
    setState(() {
      //set row based on indexUn
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
          return;
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
    });
  }

  //function to handle key taps - right grid
  void tappedUnRight(String input) {
    setState(() {
      //set row based on indexUn
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
          return;
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
          // All attempts used, handle game over condition
          gameoverIndicator();
          answerIndicatorUn();
          answerIndicatorUnRight();
          correctWord = 0;
          Provider.of<UnlimitedStats>(context, listen: false).lostStreak();
          Provider.of<UnlimitedStats>(context, listen: false).gamesPlayedCounter();
          indexUn = 7; // Set indexUn to a value that prevents further input
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
      //set row based on indexUn
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
          return;
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
    });
  }

  //function to backspace - right
  void backspaceUnRight () {
    setState(() {
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
          return;
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

  // Function to build a styled container for each key
  Widget buildStyledContainerUn(String label, List color) {
    return GestureDetector(
      onTap: () {
        tappedUn(label);
        tappedUnRight(label);
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
  Widget keyboardUn() {
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
                  backspaceUnRight();
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
    Future.delayed(const Duration(seconds: 2), () {
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

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  newGame();
                },
                child: Container(
                  height: 28,
                  width: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dorbleGridUn(),
              SizedBox(
                width: 15,
                height: 5,
              ),
              dorbleGridUnRight(),
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
            ]
          ),
          SizedBox(
            height: 200,
            width: 40,
          ),
          Center(
            child: keyboardUn(),
          ),
          if (showAds && _isAdLoaded && _bannerAd != null)
            SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
        ],
      ),
    );
  }
}