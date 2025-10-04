import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:flutter/material.dart';

//function to build the dorble grid containers
Widget dorbleGridContainer(String input, List color) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 36,
          height: 36,
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