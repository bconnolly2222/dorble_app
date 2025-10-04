import 'package:dorble/Variables/list_variables.dart';
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