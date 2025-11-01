// Lists to hold the keyUnboard layUnout
import 'package:dorble/word_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//SharedPrefernces for Unlimited Dorble
late SharedPreferences unlimited;
bool finishedGameUn = false;

Future<void> initUnlimited() async {
  unlimited = await SharedPreferences.getInstance();
  finishedGameUn = unlimited.getBool('finishedGameUn') ?? false;
  if (finishedGameUn == true) {
    randomIndex = random.nextInt(solutionList.length);
    answerUn = solutionList[randomIndex];
    unlimited.setString('answerUn', answerUn);

    randomIndex = random.nextInt(solutionList.length);
    answerUnRight = solutionList[randomIndex];
    if (answerUnRight == answerUn) {
      randomIndex = random.nextInt(solutionList.length);
      answerUnRight = solutionList[randomIndex];
    }
    unlimited.setString('answerUnRight', answerUnRight);

    finishedGameUn = false;
    unlimited.setBool('finishedGameUn', false);
  } else {
    randomIndex = random.nextInt(solutionList.length);
    answerUn = solutionList[randomIndex];

    randomIndex = random.nextInt(solutionList.length);
    answerUnRight = solutionList[randomIndex];
    if (answerUnRight == answerUn) {
      randomIndex = random.nextInt(solutionList.length);
      answerUnRight = solutionList[randomIndex];
    }
    answerUn = unlimited.getString('answerUn') ?? answerUn;
    answerUnRight = unlimited.getString('answerUnRight') ?? answerUnRight;
  }
}

List row1Un = ["", "", "", "" ,""];
List row2Un = ["", "", "", "" ,""];
List row3Un = ["", "", "", "" ,""];
List row4Un = ["", "", "", "" ,""];
List row5Un = ["", "", "", "" ,""];
List row6Un = ["", "", "", "" ,""];
List row7Un = ["", "", "", "" ,""];

List row1RightUn = ["", "", "", "" ,""];
List row2RightUn = ["", "", "", "" ,""];
List row3RightUn = ["", "", "", "" ,""];
List row4RightUn = ["", "", "", "" ,""];
List row5RightUn = ["", "", "", "" ,""];
List row6RightUn = ["", "", "", "" ,""];
List row7RightUn = ["", "", "", "" ,""];





//BoxUn colors and boxUn color layUnout
List yellowBoxColor = [192, 190, 49];
List greenBoxColor = [106, 170, 100];
List greyBoxColor = [50, 50, 50];
List defaultBoxColor = [0, 0, 0];

List colorow1Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow2Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow3Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow4Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow5Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow6Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow7Un = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];

List colorow1RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow2RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow3RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow4RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow5RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow6RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow7RightUn = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];


//Variables for logic - DAILY DORBLE
List xUn = []; //iterates row for letter
List yUn = []; //iterates row for color
List rUn = []; //iterates row for right grid color
int indexUn = 0;
int indexUnRight = 0;




//map functions
Map answermapUn = {};
Map answermapUnRight = {};
Map xmapUn = {};
Map xmapUnRight = {};


void emptyUn(Map xUnmap, List xUn) {
  for (String letter in xUn) {
    if (!xUnmap.containsKey(letter)) {
      xUnmap[letter] = 0;
    } else {
      xUnmap[letter] += 0;
    }
  }
}

void emptyanswerUn(Map xUnmap, List xUn) {
  for (String letter in xUn) {
    if (!xUnmap.containsKey(letter)) {
      xUnmap[letter] = 1;
    } else {
      xUnmap[letter] += 1;
    }
  }
}

//display indicator variables
//top indicator
String displayUn = "";
Color displayColorUn = Colors.transparent;

//answer indicator
String displayUnRightanswer = "";
Color displayUnRightcolor = Colors.transparent;
String displayUnanswer = "";
Color displayUncolor = Colors.transparent;

//index for theme switch
int answerIndicatorUnIndex = 0;
int answerIndicatorUnRightIndex = 0;

//game win - both words right
int correctWord = 0;

//Variables and function for keyUnboard coloring
List defkeyUnbcolor = [158, 158, 158];

List toprowUn = [defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor];
List middlerowUn = [defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor];
List bottomrowUn = [defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor,defkeyUnbcolor];

void keyboardcolorUn(String letter, List color) {
  switch (letter) {
    case "Q":
      if (toprowUn[0] != greenBoxColor) {
        toprowUn[0] = color;
      }
    case "W":
      if (toprowUn[1] != greenBoxColor) {
        toprowUn[1] = color;
      }
    case "E":
      if (toprowUn[2] != greenBoxColor) {
        toprowUn[2] = color;
      }
    case "R":
      if (toprowUn[3] != greenBoxColor) {
        toprowUn[3] = color;
      }
    case "T":
      if (toprowUn[4] != greenBoxColor) {
        toprowUn[4] = color;
      }
    case "Y":
      if (toprowUn[5] != greenBoxColor) {
        toprowUn[5] = color;
      }
    case "U":
      if (toprowUn[6] != greenBoxColor) {
        toprowUn[6] = color;
      }
    case "I":
      if (toprowUn[7] != greenBoxColor) {
        toprowUn[7] = color;
      }
    case "O":
      if (toprowUn[8] != greenBoxColor) {
        toprowUn[8] = color;
      }
    case "P":
      if (toprowUn[9] != greenBoxColor) {
        toprowUn[9] = color;
      }
    case "A":
      if (middlerowUn[0] != greenBoxColor) {
        middlerowUn[0] = color;
      }
    case "S":
      if (middlerowUn[1] != greenBoxColor) {
        middlerowUn[1] = color;
      }
    case "D":
      if (middlerowUn[2] != greenBoxColor) {
        middlerowUn[2] = color;
      }
    case "F":
      if (middlerowUn[3] != greenBoxColor) {
        middlerowUn[3] = color;
      }
    case "G":
      if (middlerowUn[4] != greenBoxColor) {
        middlerowUn[4] = color;
      }
    case "H":
      if (middlerowUn[5] != greenBoxColor) {
        middlerowUn[5] = color;
      }
    case "J":
      if (middlerowUn[6] != greenBoxColor) {
        middlerowUn[6] = color;
      }
    case "K":
      if (middlerowUn[7] != greenBoxColor) {
        middlerowUn[7] = color;
      }
    case "L":
      if (middlerowUn[8] != greenBoxColor) {
        middlerowUn[8] = color;
      }
    case "Z":
      if (bottomrowUn[0] != greenBoxColor) {
        bottomrowUn[0] = color;
      }
    case "xUn":
      if (bottomrowUn[1] != greenBoxColor) {
        bottomrowUn[1] = color;
      }
    case "C":
      if (bottomrowUn[2] != greenBoxColor) {
        bottomrowUn[2] = color;
      }
    case "V":
      if (bottomrowUn[3] != greenBoxColor) {
        bottomrowUn[3] = color;
      }
    case "B":
      if (bottomrowUn[4] != greenBoxColor) {
        bottomrowUn[4] = color;
      }
    case "N":
      if (bottomrowUn[5] != greenBoxColor) {
        bottomrowUn[5] = color;
      }
    case "M":
      if (bottomrowUn[6] != greenBoxColor) {
        bottomrowUn[6] = color;
      }
  }
}

void keyboardcolorGreyChangeUn(String letter, List color) {
  switch (letter) {
    case "Q":
      if (toprowUn[0] != greenBoxColor && toprowUn[0] != yellowBoxColor) {
        toprowUn[0] = color;
      }
    case "W":
      if (toprowUn[1] != greenBoxColor && toprowUn[1] != yellowBoxColor) {
        toprowUn[1] = color;
      }
    case "E":
      if (toprowUn[2] != greenBoxColor && toprowUn[2] != yellowBoxColor) {
        toprowUn[2] = color;
      }
    case "R":
      if (toprowUn[3] != greenBoxColor && toprowUn[3] != yellowBoxColor) {
        toprowUn[3] = color;
      }
    case "T":
      if (toprowUn[4] != greenBoxColor && toprowUn[4] != yellowBoxColor) {
        toprowUn[4] = color;
      }
    case "Y":
      if (toprowUn[5] != greenBoxColor && toprowUn[5] != yellowBoxColor) {
        toprowUn[5] = color;
      }
    case "U":
      if (toprowUn[6] != greenBoxColor && toprowUn[6] != yellowBoxColor) {
        toprowUn[6] = color;
      }
    case "I":
      if (toprowUn[7] != greenBoxColor && toprowUn[7] != yellowBoxColor) {
        toprowUn[7] = color;
      }
    case "O":
      if (toprowUn[8] != greenBoxColor && toprowUn[8] != yellowBoxColor) {
        toprowUn[8] = color;
      }
    case "P":
      if (toprowUn[9] != greenBoxColor && toprowUn[9] != yellowBoxColor) {
        toprowUn[9] = color;
      }
    case "A":
      if (middlerowUn[0] != greenBoxColor && middlerowUn[0] != yellowBoxColor) {
        middlerowUn[0] = color;
      }
    case "S":
      if (middlerowUn[1] != greenBoxColor && middlerowUn[1] != yellowBoxColor) {
        middlerowUn[1] = color;
      }
    case "D":
      if (middlerowUn[2] != greenBoxColor && middlerowUn[2] != yellowBoxColor) {
        middlerowUn[2] = color;
      }
    case "F":
      if (middlerowUn[3] != greenBoxColor && middlerowUn[3] != yellowBoxColor) {
        middlerowUn[3] = color;
      }
    case "G":
      if (middlerowUn[4] != greenBoxColor && middlerowUn[4] != yellowBoxColor) {
        middlerowUn[4] = color;
      }
    case "H":
      if (middlerowUn[5] != greenBoxColor && middlerowUn[5] != yellowBoxColor) {
        middlerowUn[5] = color;
      }
    case "J":
      if (middlerowUn[6] != greenBoxColor && middlerowUn[6] != yellowBoxColor) {
        middlerowUn[6] = color;
      }
    case "K":
      if (middlerowUn[7] != greenBoxColor && middlerowUn[7] != yellowBoxColor) {
        middlerowUn[7] = color;
      }
    case "L":
      if (middlerowUn[8] != greenBoxColor && middlerowUn[8] != yellowBoxColor) {
        middlerowUn[8] = color;
      }
    case "Z":
      if (bottomrowUn[0] != greenBoxColor && bottomrowUn[0] != yellowBoxColor) {
        bottomrowUn[0] = color;
      }
    case "xUn":
      if (bottomrowUn[1] != greenBoxColor && bottomrowUn[1] != yellowBoxColor) {
        bottomrowUn[1] = color;
      }
    case "C":
      if (bottomrowUn[2] != greenBoxColor && bottomrowUn[2] != yellowBoxColor) {
        bottomrowUn[2] = color;
      }
    case "V":
      if (bottomrowUn[3] != greenBoxColor && bottomrowUn[3] != yellowBoxColor) {
        bottomrowUn[3] = color;
      }
    case "B":
      if (bottomrowUn[4] != greenBoxColor && bottomrowUn[4] != yellowBoxColor) {
        bottomrowUn[4] = color;
      }
    case "N":
      if (bottomrowUn[5] != greenBoxColor && bottomrowUn[5] != yellowBoxColor) {
        bottomrowUn[5] = color;
      }
    case "M":
      if (bottomrowUn[6] != greenBoxColor && bottomrowUn[6] != yellowBoxColor) {
        bottomrowUn[6] = color;
      }
  }
}