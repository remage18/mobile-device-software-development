import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/shared_prefs.dart';
import '../components.dart';
import '../models/track.dart';

class HomeScreen extends StatefulWidget {
  //final ValueChanged<Track> onChanged;
  late DarkThemeProvider theme;
  late void Function() onSettingsTap;

  HomeScreen(
      {Key? key, DarkThemeProvider? theme, void Function()? onSettingsTap})
      : super(key: key) {
    this.theme = theme!;
    this.onSettingsTap = onSettingsTap!;
  }
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 55, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Youtube Music',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: CustomColors(widget.theme.darkTheme).color,
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
                          color: CustomColors(widget.theme.darkTheme).color,
                        ),
                        onPressed: () async {
                          var str =
                              await Navigator.pushNamed(context, '/navigation');
                          print(str);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: CustomColors(widget.theme.darkTheme).color,
                        ),
                        onPressed: this.widget.onSettingsTap,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            Container(
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  new Type(
                    text: 'Тренировка',
                    isDarkTheme: widget.theme.darkTheme,
                  ),
                  new Type(
                    text: 'Заряд энергии',
                    isDarkTheme: widget.theme.darkTheme,
                  ),
                  new Type(
                    text: 'Расслабление',
                    isDarkTheme: widget.theme.darkTheme,
                  ),
                  new Type(
                    text: 'Дорога',
                    isDarkTheme: widget.theme.darkTheme,
                  ),
                  new Type(
                    text: 'Концентрация',
                    isDarkTheme: widget.theme.darkTheme,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'СОЗДАТЬ РАДИО НА ОСНОВЕ КОМПОЗИЦИИ',
                  style: TextStyle(
                    fontSize: 15,
                    color: CustomColors(widget.theme.darkTheme).artistNameColor,
                  ),
                ),
                Container(margin: EdgeInsets.only(bottom: 7)),
                Text(
                  'Подборки по треку',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: CustomColors(widget.theme.darkTheme).color,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 280,
                  padding: EdgeInsets.zero,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 15);
                    },
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return new Container(
                        padding: EdgeInsets.zero,
                        width: 320,
                        child: Column(
                          children: [
                            new SelectionConsumer(
                              trackImage: 'assets/images/lil_peep.jpg',
                              trackName: 'Star Shopping',
                              artistName: 'LiL Peep',
                              isDarkTheme: widget.theme.darkTheme,
                            ),
                            new SelectionConsumer(
                              trackImage: 'assets/images/imagine_dragons.jpg',
                              trackName: 'Believer',
                              artistName: 'Imagine Dragons',
                              isDarkTheme: widget.theme.darkTheme,
                            ),
                            new SelectionConsumer(
                              trackImage: 'assets/images/21_pilots.jpg',
                              trackName: 'Heathens',
                              artistName: 'Twenty One Pilots',
                              isDarkTheme: widget.theme.darkTheme,
                            ),
                            new SelectionConsumer(
                              trackImage: 'assets/images/eminem.jpg',
                              trackName: 'Say What You Say',
                              artistName: 'Eminem',
                              isDarkTheme: widget.theme.darkTheme,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Новинки недели',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: CustomColors(widget.theme.darkTheme).color,
                      ),
                    )),
                Container(
                  height: 410,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/released.jpg',
                        height: 352,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'RELEASED',
                        style: TextStyle(
                          fontSize: 18,
                          color: CustomColors(widget.theme.darkTheme).color,
                        ),
                      ),
                      Container(margin: EdgeInsets.only(bottom: 3)),
                      Text(
                        'twocolors, Джарахов, Navai и OneRepublic',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: CustomColors(widget.theme.darkTheme)
                              .trackNameColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    'Миксы для вас',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: CustomColors(widget.theme.darkTheme).color,
                    ),
                  ),
                ),
                Container(
                  height: 220,
                  padding: EdgeInsets.zero,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 15);
                    },
                    shrinkWrap: true,
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return new Container(
                        padding: EdgeInsets.zero,
                        width: 150,
                        child: Wrap(
                          children: [
                            Image.asset(
                              'assets/images/mix.jpg',
                              height: 150,
                              width: 150,
                            ),
                            Container(margin: EdgeInsets.only(bottom: 8)),
                            Text('Мой супермикс',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors(widget.theme.darkTheme)
                                      .color,
                                )),
                            Container(margin: EdgeInsets.only(bottom: 3)),
                            Text(
                              'Imagine dragons, Mike Shinoda, Bring me the horizon',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 13,
                                color: CustomColors(widget.theme.darkTheme)
                                    .trackNameColor,
                              ),
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
