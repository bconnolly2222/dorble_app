import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

// Decoration variables
static const double padding = 14.0;
static const double radius = 40;
static const double height = 80;
static const double width = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      //Removed appbar for cleaner look
      //appBar: AppBar(
        //backgroundColor: Colors.grey[600],
        //),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Title of home page
            Padding(
              padding: const EdgeInsets.all(padding),
                child: Text("D O R B L E !",
                  style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                  ),
                ),
            ),

            //Daily Dorble button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/daily');
              },
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 204, 195, 70),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: const Center(
                    child: Text("Daily Dorble", style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ),
                ),
              ),
            ),

            //Unlimited Dorble button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/unlimited');
              },
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 146, 50),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: Center(
                    child: Text("Unlimited Dorble", style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  ),
                ),
              ),
            ),

            //Statistics button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/statistics');
              },
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 84, 75),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text("Statistics", style: TextStyle(color: Colors.white, fontSize: 24),),
                      ),
                      Center(
                        child: Icon(Icons.bar_chart, color: Colors.white, size: 28)
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Settings button
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Padding(
                padding: const EdgeInsets.all(padding),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 89, 95, 89),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 24),),
                      ),
                      Center(
                        child: Icon(Icons.settings, color: Colors.white, size: 28)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}