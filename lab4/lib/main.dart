import 'package:lab4/models/shared_prefs.dart';
import 'package:lab4/screens/library.dart';
import 'package:lab4/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:lab4/screens/home.dart';
import 'models/track.dart';
import 'models/shared_prefs.dart';
import 'components.dart';
import '../request.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TrackConsumer(),
          ),
          ChangeNotifierProvider(
            create: (context) => DarkThemeProvider(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => YoutubeMusicMain(),
            '/navigation': (context) => NavigationScreen(
                  str: 'type searched track here',
                  theme: Provider.of<DarkThemeProvider>(context),
                ),
          },
        ),
      ),
    );

class YoutubeMusicMain extends StatefulWidget {
  const YoutubeMusicMain({Key? key}) : super(key: key);

  @override
  State<YoutubeMusicMain> createState() => _YoutubeMusicMainState();
}

class _YoutubeMusicMainState extends State<YoutubeMusicMain> {
  late DarkThemeProvider themeChangeProvider =
      Provider.of<DarkThemeProvider>(context);
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _handlePageTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomeScreen(
        theme: themeChangeProvider,
        onSettingsTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Settings()));
        },
      ),
      HomeScreen(
        theme: themeChangeProvider,
        onSettingsTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Settings()));
        },
      ),
      LibraryScreen(
        theme: themeChangeProvider,
        onSettingsTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Settings()));
        },
      )
    ];

    return Scaffold(
      backgroundColor:
          CustomColors(themeChangeProvider.darkTheme).backgroundColor,
      body: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            CustomColors(themeChangeProvider.darkTheme).bottomNavBarColor,
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
        selectedItemColor: CustomColors(themeChangeProvider.darkTheme).color,
        unselectedItemColor:
            CustomColors(themeChangeProvider.darkTheme).unselectedColor,
        onTap: _handlePageTap,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late DarkThemeProvider themeChangeProvider =
      Provider.of<DarkThemeProvider>(context);

  void _handleChangethemeTap(bool? value) {
    if (value != null) {
      setState(() {
        themeChangeProvider.darkTheme = value;
      });
    }
  }

  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          CustomColors(themeChangeProvider.darkTheme).backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 55, 20, 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: CustomColors(themeChangeProvider.darkTheme)
                                .color,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          "Настройки",
                          style: TextStyle(
                            color: CustomColors(themeChangeProvider.darkTheme)
                                .color,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FutureBuilder<Album>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!.title,
                              style: TextStyle(
                                  color: CustomColors(
                                          themeChangeProvider.darkTheme)
                                      .color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                              '${snapshot.error}',
                              style: TextStyle(
                                  color: CustomColors(
                                          themeChangeProvider.darkTheme)
                                      .color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            );
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  color: CustomColors(
                                          themeChangeProvider.darkTheme)
                                      .borderColor))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Темная тема",
                              style: TextStyle(
                                  color: CustomColors(
                                          themeChangeProvider.darkTheme)
                                      .color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800)),
                          Switch(
                            value: themeChangeProvider.darkTheme,
                            onChanged: _handleChangethemeTap,
                            activeColor:
                                CustomColors(themeChangeProvider.darkTheme)
                                    .switchColor,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
