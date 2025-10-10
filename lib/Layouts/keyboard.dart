//DEFAULT KEYBOARD LAYOUT - COPIED AND PASTED INTO DORBLE PAGES FOR SETSTATE FUNCTIONALITY
import 'package:flutter/material.dart';

double height = 70;
// Function to build a styled container for each key
Widget buildStyledContainer(String label) {
  return GestureDetector(
    onTap: () {
      // Handle tap event for the key
    },
    child: Container(
      width: 40,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
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
            buildStyledContainer('Q'),
            buildStyledContainer('W'),
            buildStyledContainer('E'),
            buildStyledContainer('R'),
            buildStyledContainer('T'),
            buildStyledContainer('Y'),
            buildStyledContainer('U'),
            buildStyledContainer('I'),
            buildStyledContainer('O'),
            buildStyledContainer('P'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildStyledContainer('A'),
            buildStyledContainer('S'),
            buildStyledContainer('D'),
            buildStyledContainer('F'),
            buildStyledContainer('G'),
            buildStyledContainer('H'),
            buildStyledContainer('J'),
            buildStyledContainer('K'),
            buildStyledContainer('L'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Handle tap event for Enter key
              },
              child: Container(
                width: 60,
                height: height,
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
            buildStyledContainer('Z'),
            buildStyledContainer('X'),
            buildStyledContainer('C'),
            buildStyledContainer('V'),
            buildStyledContainer('B'),
            buildStyledContainer('N'),
            buildStyledContainer('M'),
            GestureDetector(
              onTap: () {
                // Handle tap event for Backspace key
              },
              child: Container(
                width: 60,
                height: height,
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