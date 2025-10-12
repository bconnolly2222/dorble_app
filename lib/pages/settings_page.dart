import 'package:dorble/Variables/stats.dart';
import 'package:dorble/database.dart';
import 'package:dorble/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        title: Text('Settings',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.light_mode_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Light Mode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 211,
                ),
                Switch(
                  value: ThemeProvider.isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      ThemeProvider.isSwitched = value;
                    });
                    Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  },
                  activeThumbColor: Colors.white,
                  activeTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.black87,
                  inactiveTrackColor: Colors.white70,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.bar_chart,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Reset Stats",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 208,
                ),
                ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('WARNING:'),
                          content: Text('Are you sure you want to erase your statistics data? This will delete both Daily and Unlimited Stats.'),
                          actions: <Widget> [
                            TextButton(child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(child: Text('RESET'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Provider.of<DailyStats>(context, listen: false).clearSharedPref();
                                Provider.of<UnlimitedStats>(context, listen: false).clearSharedPref();
                              },
                            ),
                          ]
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    fixedSize: const Size(20, 20),
                  ),
                  child: Icon(Icons.clear_all_outlined),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.info_outline,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("About",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 258,
                ),
                ElevatedButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('About Dorble'),
                          content: Text('This is our first ever mobile app, so please share a review with feedback and any issues you encounter! We will contiune to make improvements, fix bugs, and add features over time. Thank you for playing!'),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    fixedSize: const Size(20, 20),
                  ),
                  child: Icon(Icons.clear_all_outlined),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('New games coming soon!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 550),
            if (showAds && _isAdLoaded && _bannerAd != null)
              SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
          ],
        ),
      ),
    );
  }
}