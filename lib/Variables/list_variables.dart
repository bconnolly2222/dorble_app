// Lists to hold the keyboard layout

import 'package:flutter/material.dart';

List row1 = ["", "", "", "" ,""];
List row2 = ["", "", "", "" ,""];
List row3 = ["", "", "", "" ,""];
List row4 = ["", "", "", "" ,""];
List row5 = ["", "", "", "" ,""];
List row6 = ["", "", "", "" ,""];
List row7 = ["", "", "", "" ,""];

List row1Right = ["", "", "", "" ,""];
List row2Right = ["", "", "", "" ,""];
List row3Right = ["", "", "", "" ,""];
List row4Right = ["", "", "", "" ,""];
List row5Right = ["", "", "", "" ,""];
List row6Right = ["", "", "", "" ,""];
List row7Right = ["", "", "", "" ,""];





//Box colors and box color layout
List yellowBoxColor = [192, 190, 49];
List greenBoxColor = [106, 170, 100];
List greyBoxColor = [50, 50, 50];
List defaultBoxColor = [0, 0, 0];

List colorow1 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow2 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow3 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow4 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow5 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow6 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow7 = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];

List colorow1Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow2Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow3Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow4Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow5Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow6Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];
List colorow7Right = [defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor, defaultBoxColor];


//Variables for logic - DAILY DORBLE
List x = []; //iterates row for letter
List y = []; //iterates row for color
List r = []; //iterates row for right grid color
int index = 0;
int indexRight = 0;




//map functions
Map answermap = {};
Map answermapRight = {};
Map xmap = {};
Map xmapRight = {};


empty(Map xmap, List x) {
  for (String letter in x) {
    if (!xmap.containsKey(letter)) {
      xmap[letter] = 0;
    } else {
      xmap[letter] += 0;
    }
  }
}

emptyanswer(Map xmap, List x) {
  for (String letter in x) {
    if (!xmap.containsKey(letter)) {
      xmap[letter] = 1;
    } else {
      xmap[letter] += 1;
    }
  }
}


//top indicator
String display = "";
Color displayColor = Colors.transparent;

//answer indicator
String displayAnswer = "";
Color displayAnswerColor = Colors.transparent;
String displayRightAnswer = "";
Color displayRightColor = Colors.transparent;

//index for theme switch
int answerIndicatorIndex = 0;
int answerIndicatorRightIndex = 0;

//game win - both words right
int correctWordDaily = 0;

//Variables and function for keyboard coloring
List defkeybcolor = [158, 158, 158];

List toprow = [defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor];
List middlerow = [defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor];
List bottomrow = [defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor,defkeybcolor];

void keyboardcolor(String letter, List color) {
  switch (letter) {
    case "Q":
      if (toprow[0] != greenBoxColor) {
        toprow[0] = color;
      }
    case "W":
      if (toprow[1] != greenBoxColor) {
        toprow[1] = color;
      }
    case "E":
      if (toprow[2] != greenBoxColor) {
        toprow[2] = color;
      }
    case "R":
      if (toprow[3] != greenBoxColor) {
        toprow[3] = color;
      }
    case "T":
      if (toprow[4] != greenBoxColor) {
        toprow[4] = color;
      }
    case "Y":
      if (toprow[5] != greenBoxColor) {
        toprow[5] = color;
      }
    case "U":
      if (toprow[6] != greenBoxColor) {
        toprow[6] = color;
      }
    case "I":
      if (toprow[7] != greenBoxColor) {
        toprow[7] = color;
      }
    case "O":
      if (toprow[8] != greenBoxColor) {
        toprow[8] = color;
      }
    case "P":
      if (toprow[9] != greenBoxColor) {
        toprow[9] = color;
      }
    case "A":
      if (middlerow[0] != greenBoxColor) {
        middlerow[0] = color;
      }
    case "S":
      if (middlerow[1] != greenBoxColor) {
        middlerow[1] = color;
      }
    case "D":
      if (middlerow[2] != greenBoxColor) {
        middlerow[2] = color;
      }
    case "F":
      if (middlerow[3] != greenBoxColor) {
        middlerow[3] = color;
      }
    case "G":
      if (middlerow[4] != greenBoxColor) {
        middlerow[4] = color;
      }
    case "H":
      if (middlerow[5] != greenBoxColor) {
        middlerow[5] = color;
      }
    case "J":
      if (middlerow[6] != greenBoxColor) {
        middlerow[6] = color;
      }
    case "K":
      if (middlerow[7] != greenBoxColor) {
        middlerow[7] = color;
      }
    case "L":
      if (middlerow[8] != greenBoxColor) {
        middlerow[8] = color;
      }
    case "Z":
      if (bottomrow[0] != greenBoxColor) {
        bottomrow[0] = color;
      }
    case "X":
      if (bottomrow[1] != greenBoxColor) {
        bottomrow[1] = color;
      }
    case "C":
      if (bottomrow[2] != greenBoxColor) {
        bottomrow[2] = color;
      }
    case "V":
      if (bottomrow[3] != greenBoxColor) {
        bottomrow[3] = color;
      }
    case "B":
      if (bottomrow[4] != greenBoxColor) {
        bottomrow[4] = color;
      }
    case "N":
      if (bottomrow[5] != greenBoxColor) {
        bottomrow[5] = color;
      }
    case "M":
      if (bottomrow[6] != greenBoxColor) {
        bottomrow[6] = color;
      }
  }
}

void keyboardcolorGreyChange(String letter, List color) {
  switch (letter) {
    case "Q":
      if (toprow[0] != greenBoxColor && toprow[0] != yellowBoxColor) {
        toprow[0] = color;
      }
    case "W":
      if (toprow[1] != greenBoxColor && toprow[1] != yellowBoxColor) {
        toprow[1] = color;
      }
    case "E":
      if (toprow[2] != greenBoxColor && toprow[2] != yellowBoxColor) {
        toprow[2] = color;
      }
    case "R":
      if (toprow[3] != greenBoxColor && toprow[3] != yellowBoxColor) {
        toprow[3] = color;
      }
    case "T":
      if (toprow[4] != greenBoxColor && toprow[4] != yellowBoxColor) {
        toprow[4] = color;
      }
    case "Y":
      if (toprow[5] != greenBoxColor && toprow[5] != yellowBoxColor) {
        toprow[5] = color;
      }
    case "U":
      if (toprow[6] != greenBoxColor && toprow[6] != yellowBoxColor) {
        toprow[6] = color;
      }
    case "I":
      if (toprow[7] != greenBoxColor && toprow[7] != yellowBoxColor) {
        toprow[7] = color;
      }
    case "O":
      if (toprow[8] != greenBoxColor && toprow[8] != yellowBoxColor) {
        toprow[8] = color;
      }
    case "P":
      if (toprow[9] != greenBoxColor && toprow[9] != yellowBoxColor) {
        toprow[9] = color;
      }
    case "A":
      if (middlerow[0] != greenBoxColor && middlerow[0] != yellowBoxColor) {
        middlerow[0] = color;
      }
    case "S":
      if (middlerow[1] != greenBoxColor && middlerow[1] != yellowBoxColor) {
        middlerow[1] = color;
      }
    case "D":
      if (middlerow[2] != greenBoxColor && middlerow[2] != yellowBoxColor) {
        middlerow[2] = color;
      }
    case "F":
      if (middlerow[3] != greenBoxColor && middlerow[3] != yellowBoxColor) {
        middlerow[3] = color;
      }
    case "G":
      if (middlerow[4] != greenBoxColor && middlerow[4] != yellowBoxColor) {
        middlerow[4] = color;
      }
    case "H":
      if (middlerow[5] != greenBoxColor && middlerow[5] != yellowBoxColor) {
        middlerow[5] = color;
      }
    case "J":
      if (middlerow[6] != greenBoxColor && middlerow[6] != yellowBoxColor) {
        middlerow[6] = color;
      }
    case "K":
      if (middlerow[7] != greenBoxColor && middlerow[7] != yellowBoxColor) {
        middlerow[7] = color;
      }
    case "L":
      if (middlerow[8] != greenBoxColor && middlerow[8] != yellowBoxColor) {
        middlerow[8] = color;
      }
    case "Z":
      if (bottomrow[0] != greenBoxColor && bottomrow[0] != yellowBoxColor) {
        bottomrow[0] = color;
      }
    case "X":
      if (bottomrow[1] != greenBoxColor && bottomrow[1] != yellowBoxColor) {
        bottomrow[1] = color;
      }
    case "C":
      if (bottomrow[2] != greenBoxColor && bottomrow[2] != yellowBoxColor) {
        bottomrow[2] = color;
      }
    case "V":
      if (bottomrow[3] != greenBoxColor && bottomrow[3] != yellowBoxColor) {
        bottomrow[3] = color;
      }
    case "B":
      if (bottomrow[4] != greenBoxColor && bottomrow[4] != yellowBoxColor) {
        bottomrow[4] = color;
      }
    case "N":
      if (bottomrow[5] != greenBoxColor && bottomrow[5] != yellowBoxColor) {
        bottomrow[5] = color;
      }
    case "M":
      if (bottomrow[6] != greenBoxColor && bottomrow[6] != yellowBoxColor) {
        bottomrow[6] = color;
      }
  }
}