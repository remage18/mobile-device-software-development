import 'package:lab3/screens/library.dart';
import 'package:lab3/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:lab3/screens/home.dart';
import 'models/track.dart';
import 'components.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => TrackConsumer(),
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: YoutubeMusicMain(),
        ),
      ),
    );

class YoutubeMusicMain extends StatefulWidget {
  const YoutubeMusicMain({Key? key}) : super(key: key);

  @override
  State<YoutubeMusicMain> createState() => _YoutubeMusicMainState();
}

class _YoutubeMusicMainState extends State<YoutubeMusicMain> {
  int _selectedIndex = 0;

  void _handlePageTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleLikeTap(Track likedTrack) {
    setState(() {
      Object? existed = liked_tracks.remove(likedTrack.hashCode);
      if (existed == null) {
        liked_tracks[likedTrack.hashCode] = likedTrack;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<StatelessWidget> _widgetOptions = <StatelessWidget>[
      HomeScreen(
        onChanged: _handleLikeTap,
      ),
      NavigationScreen(),
      LibraryScreen()
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(30, 30, 30, 100),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_sharp),
            label: 'Навигатор',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_sharp),
            label: 'Библиотека',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(200, 200, 200, 100),
        onTap: _handlePageTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
