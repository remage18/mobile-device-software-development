import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'models/track.dart';

Map<int, Track> liked_tracks = {};

class Type extends StatelessWidget {
  final String text;

  const Type({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Text(this.text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          )),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(30, 30, 30, 100),
          border: Border.all(color: Color.fromRGBO(80, 80, 80, 100)),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      alignment: Alignment.center,
    );
  }
}

class Selection extends StatelessWidget {
  final String trackImage, trackName, artistName;
  late final Track likedTracks;

  final ValueChanged<Track> onChanged;

  void _handleTap() {
    onChanged(likedTracks);
  }

  Selection(
      {Key? key,
      required this.trackImage,
      required this.trackName,
      required this.artistName,
      required this.onChanged})
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
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(this.artistName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(250, 250, 250, 100),
                          fontWeight: FontWeight.w100,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: IconButton(
                icon: (liked_tracks.containsKey(likedTracks.hashCode))
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                tooltip: 'Like the track',
                onPressed: _handleTap),
          ),
        ],
      ),
    );
  }
}

class SelectionConsumer extends StatelessWidget {
  final String trackImage, trackName, artistName;
  late final Track likedTracks;

  SelectionConsumer(
      {Key? key,
      required this.trackImage,
      required this.trackName,
      required this.artistName})
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
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(this.artistName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(250, 250, 250, 100),
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
  const LikedTracks({Key? key, required this.track}) : super(key: key);

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
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(track.artistName,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(250, 250, 250, 100),
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
                  color: Colors.white,
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
