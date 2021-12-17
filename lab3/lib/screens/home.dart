import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../components.dart';
import '../models/track.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<Track> onChanged;

  const HomeScreen({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

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
                  flex: 2,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/youtube1.png',
                        height: 25,
                      ),
                    ],
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
            SizedBox(height: 40),
            Container(
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  new Type(text: 'Тренировка'),
                  new Type(text: 'Заряд энергии'),
                  new Type(text: 'Расслабление'),
                  new Type(text: 'Дорога'),
                  new Type(text: 'Концентрация'),
                ],
              ),
            ),
            SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'СОЗДАТЬ РАДИО НА ОСНОВЕ КОМПОЗИЦИИ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(250, 250, 250, 100),
                  ),
                ),
                Container(margin: EdgeInsets.only(bottom: 7)),
                Text(
                  'Подборки по треку',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
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
                            new Selection(
                              trackImage: 'assets/images/lil_peep.jpg',
                              trackName: 'Star Shopping',
                              artistName: 'LiL Peep',
                              onChanged: onChanged,
                            ),
                            new Selection(
                              trackImage: 'assets/images/imagine_dragons.jpg',
                              trackName: 'Believer',
                              artistName: 'Imagine Dragons',
                              onChanged: onChanged,
                            ),
                            new SelectionConsumer(
                              trackImage: 'assets/images/21_pilots.jpg',
                              trackName: 'Heathens',
                              artistName: 'Twenty One Pilots',
                            ),
                            new SelectionConsumer(
                              trackImage: 'assets/images/eminem.jpg',
                              trackName: 'Say What You Say',
                              artistName: 'Eminem',
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
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(margin: EdgeInsets.only(bottom: 3)),
                      Text(
                        'twocolors, Джарахов, Navai и OneRepublic',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(200, 200, 200, 100),
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
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                            Container(margin: EdgeInsets.only(bottom: 3)),
                            Text(
                              'Imagine dragons, Mike Shinoda, Bring me the horizon',
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(200, 200, 200, 100),
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
