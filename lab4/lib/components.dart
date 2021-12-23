import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'models/track.dart';

class CustomColors {
  late Color backgroundColor;
  late Color color;
  late Color borderColor;
  late Color switchColor;
  late Color trackNameColor;
  late Color artistNameColor;
  late Color bottomNavBarColor;
  late Color unselectedColor;

  CustomColors(bool isDarkTheme) {
    backgroundColor = isDarkTheme ? Colors.black : Colors.white;
    color = isDarkTheme ? Colors.white : Colors.black;
    switchColor = isDarkTheme ? Colors.blue : Colors.white;
    borderColor = isDarkTheme ? Color(0xff636363) : Colors.black;
    trackNameColor =
        isDarkTheme ? Color.fromRGBO(200, 200, 200, 100) : Colors.black;
    artistNameColor =
        isDarkTheme ? Color.fromRGBO(250, 250, 250, 100) : Colors.black;
    bottomNavBarColor =
        isDarkTheme ? Color.fromRGBO(30, 30, 30, 100) : Colors.white70;
    unselectedColor = isDarkTheme
        ? Color.fromRGBO(200, 200, 200, 100)
        : Color.fromRGBO(30, 30, 30, 100);
  }
}

Map<int, Track> liked_tracks = {};

class Type extends StatelessWidget {
  final String text;
  final bool isDarkTheme;

  const Type({Key? key, required this.text, required this.isDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text(this.text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: CustomColors(this.isDarkTheme).color,
          )),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: CustomColors(this.isDarkTheme).bottomNavBarColor,
          border: Border.all(color: Color.fromRGBO(80, 80, 80, 100)),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      alignment: Alignment.center,
    );
  }
}

class SelectionConsumer extends StatelessWidget {
  final String trackImage, trackName, artistName;
  late final Track likedTracks;
  final bool isDarkTheme;

  SelectionConsumer(
      {Key? key,
      required this.trackImage,
      required this.trackName,
      required this.artistName,
      required this.isDarkTheme})
      : super(key: key) {
    likedTracks = Track(artistName, trackName, trackImage);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Image.asset(
                  this.trackImage,
                  height: 44,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.trackName,
                      style: TextStyle(
                        fontSize: 15,
                        color: CustomColors(this.isDarkTheme).color,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(this.artistName,
                        style: TextStyle(
                          fontSize: 14,
                          color: CustomColors(this.isDarkTheme).artistNameColor,
                          fontWeight: FontWeight.w100,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Consumer<TrackConsumer>(builder: (context, library, child) {
            return Expanded(
              flex: 0,
              child: IconButton(
                  icon: (library.hasComposition(likedTracks))
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  color: CustomColors(this.isDarkTheme).color,
                  tooltip: 'Like the track',
                  onPressed: () {
                    Provider.of<TrackConsumer>(context, listen: false)
                        .addOrRemove(likedTracks);
                  }),
            );
          }),
        ],
      ),
    );
  }
}

class LikedTracks extends StatelessWidget {
  final Track track;
  final bool isDarkTheme;
  const LikedTracks({Key? key, required this.track, required this.isDarkTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Image.asset(
                      track.trackImage,
                      height: 44,
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          track.trackName,
                          style: TextStyle(
                            fontSize: 15,
                            color: CustomColors(this.isDarkTheme).color,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(track.artistName,
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColors(this.isDarkTheme)
                                  .artistNameColor,
                              fontWeight: FontWeight.w100,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Icon(
                  Icons.more_vert,
                  color: CustomColors(this.isDarkTheme).color,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
