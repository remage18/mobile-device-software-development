import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import '../components.dart';
import '../models/track.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> likedTracks = [];
    liked_tracks.entries.forEach((element) {
      likedTracks.add(LikedTracks(
        track: element.value,
      ).build(context));
    });
    Provider.of<TrackConsumer>(context, listen: false).items.forEach((element) {
      likedTracks.add(LikedTracks(
        track: element,
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
                      flex: 2,
                      child: Text(
                        'Любимые треки',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.cast_rounded,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.account_circle_sharp,
                            color: Colors.white,
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
