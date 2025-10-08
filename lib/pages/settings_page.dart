import 'package:dorble/Variables/stats.dart';
import 'package:dorble/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              height: 10,
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
          ],
        ),
      ),
    );
  }
}