import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/database.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final screenWidth = mediaQueryData.size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: screenHeight / 10), // Spacer
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
                              height: screenHeight / 12,
                              width: screenWidth / 1.7,
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
                              height: screenHeight / 12,
                              width: screenWidth / 1.7,
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
                              height: screenHeight / 12,
                              width: screenWidth / 1.7,
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
                              height: screenHeight / 12,
                              width: screenWidth / 1.7,
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
                        Expanded(child: SizedBox()), // Spacer
                        // Display the banner ad if it's loaded
                        if (showAds && _isAdLoaded && _bannerAd != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 55),
                            child: SizedBox(
                              width: _bannerAd!.size.width.toDouble(),
                              height: _bannerAd!.size.height.toDouble(),
                              child: AdWidget(ad: _bannerAd!),
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