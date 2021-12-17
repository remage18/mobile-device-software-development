import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

class Track {
  final String artistName;
  final String trackName;
  final String trackImage;

  Track(this.artistName, this.trackName, this.trackImage);

  bool operator ==(o) =>
      o is Track && artistName == o.artistName && artistName == o.artistName;
  int get hashCode => hash2(artistName.hashCode, trackName.hashCode);
}

class TrackConsumer extends ChangeNotifier {
  final List<Track> items = [];
  bool hasComposition(Track item) {
    return items.contains(item);
  }

  void addOrRemove(Track item) {
    bool existed = items.remove(item);
    if (!existed) {
      items.add(item);
    }
    notifyListeners();
  }
}
