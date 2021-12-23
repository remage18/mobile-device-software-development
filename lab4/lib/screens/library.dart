import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../components.dart';
import '../models/track.dart';
import '../models/shared_prefs.dart';

class LibraryScreen extends StatelessWidget {
  late DarkThemeProvider theme;
  late void Function() onSettingsTap;

  LibraryScreen(
      {Key? key, DarkThemeProvider? theme, void Function()? onSettingsTap})
      : super(key: key) {
    this.theme = theme!;
    this.onSettingsTap = onSettingsTap!;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> likedTracks = [];

    Provider.of<TrackConsumer>(context, listen: false).items.forEach((element) {
      likedTracks.add(LikedTracks(
        track: element,
        isDarkTheme: this.theme.darkTheme,
      ).build(context));
    });
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
        child: Column(
          children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Любимые треки',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: CustomColors(this.theme.darkTheme).color,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: CustomColors(this.theme.darkTheme).color,
                            ),
                            onPressed: () async {
                              var str = await Navigator.pushNamed(
                                  context, '/navigation');
                              print(str);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: CustomColors(this.theme.darkTheme).color,
                            ),
                            onPressed: this.onSettingsTap,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40)
              ] +
              likedTracks,
        ),
      ),
    );
  }
}
