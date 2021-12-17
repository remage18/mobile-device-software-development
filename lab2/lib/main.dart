import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
              SizedBox(height: 15),
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
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
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
              SizedBox(height: 30),
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
                    height: 260,
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
                                image: 'assets/images/lil_peep.jpg',
                                text1: 'Star Shopping',
                                text2: 'LiL Peep',
                              ),
                              new Selection(
                                image: 'assets/images/imagine_dragons.jpg',
                                text1: 'Believer',
                                text2: 'Imagine Dragons',
                              ),
                              new Selection(
                                image: 'assets/images/21_pilots.jpg',
                                text1: 'Heathens',
                                text2: 'Twenty One Pilots',
                              ),
                              new Selection(
                                image: 'assets/images/eminem.jpg',
                                text1: 'Say What You Say (feat. Dr. Dre)',
                                text2: 'Eminem',
                              ),
                            ],
                          ),
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
      ),
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
      ),
    );
  }
}

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
  final String image, text1, text2;
  const Selection(
      {Key? key, required this.image, required this.text1, required this.text2})
      : super(key: key);

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
                  this.image,
                  height: 44,
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.text1,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(this.text2,
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
    );
  }
}
