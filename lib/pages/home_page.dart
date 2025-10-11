import 'package:dorble/Variables/list_variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // Decoration variables
  static const double padding = 14.0;
  static const double radius = 40;
  static const double height = 80;
  static const double width = 250;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      //Removed appbar for cleaner look
      //appBar: AppBar(
        //backgroundColor: Colors.grey[600],
        //),
      body: Center(
        child: RefreshIndicator(
          onRefresh: initDaily,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    
                        //Title of home page
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 20), // Spacer
                            Padding(
                              padding: const EdgeInsets.all(HomePage.padding),
                                child: Text("D O R B L E !",
                                  style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial',
                                  ),
                                ),
                            ),
                            SizedBox(width: 20), // Spacer
                          ],
                        ),

                        Text('Swipe down to refresh daily solution',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                    
                        //Daily Dorble button
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/daily');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(HomePage.padding),
                            child: Container(
                              height: HomePage.height,
                              width: HomePage.width,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 204, 195, 70),
                                borderRadius: BorderRadius.circular(HomePage.radius),
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
                            padding: const EdgeInsets.all(HomePage.padding),
                            child: Container(
                              height: HomePage.height,
                              width: HomePage.width,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 35, 146, 50),
                                borderRadius: BorderRadius.circular(HomePage.radius),
                              ),
                              child: Center(
                                child: const Text("Unlimited Dorble", style: TextStyle(color: Colors.white, fontSize: 24),
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
                            padding: const EdgeInsets.all(HomePage.padding),
                            child: Container(
                              height: HomePage.height,
                              width: HomePage.width,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 216, 84, 75),
                                borderRadius: BorderRadius.circular(HomePage.radius),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: const Text("Statistics", style: TextStyle(color: Colors.white, fontSize: 24),),
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
                            padding: const EdgeInsets.all(HomePage.padding),
                            child: Container(
                              height: HomePage.height,
                              width: HomePage.width,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 89, 95, 89),
                                borderRadius: BorderRadius.circular(HomePage.radius),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: const Text("Settings", style: TextStyle(color: Colors.white, fontSize: 24),),
                                  ),
                                  Center(
                                    child: Icon(Icons.settings, color: Colors.white, size: 28)
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('How to play?'),
                                  content: Text('There are 2 grids that each contain a hidden 5-letter word. You have 7 attempts to guess the word in each grid. After each guess, the color of the tiles will change to show how close your guess was to each word. A letter in the correct position will turn green, a letter in the word but in the wrong position will turn yellow, and a letter not in the word will turn gray. Good luck and have fun!'),
                                  actions: <Widget> [
                                    TextButton(child: Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ]
                                );
                              },
                            );
                          },
                          child: Text('How to play?',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}