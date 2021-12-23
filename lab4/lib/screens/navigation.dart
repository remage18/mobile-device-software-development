import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/shared_prefs.dart';
import '../components.dart';

class NavigationScreen extends StatelessWidget {
  late DarkThemeProvider theme;

  final String str;
  NavigationScreen({
    Key? key,
    required this.str,
    DarkThemeProvider? theme,
  }) : super(key: key) {
    this.theme = theme!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors(this.theme.darkTheme).backgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: CustomColors(this.theme.darkTheme).color,
                ),
                onPressed: () {
                  Navigator.pop(context, 'returned string');
                },
              ),
              title: TextField(
                decoration: InputDecoration(
                  hintText: str,
                  hintStyle: TextStyle(
                    color: CustomColors(this.theme.darkTheme).color,
                    fontSize: 16,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: CustomColors(this.theme.darkTheme).color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
