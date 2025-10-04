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
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
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
          ],
        ),
      ),
    );
  }
}