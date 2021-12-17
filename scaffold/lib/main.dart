import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int cIndex = 0;
  static final List<Widget> tabs = <Widget>[
    Center(
      child: Container(
        color: Colors.yellow,
      ),
    ),
    Builder(
      builder: (context) => Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HeroExample(),
                ));
              },
              child: Container(
                child: Hero(
                  tag: 'img',
                  child: Image.asset(
                    'assets/images/21_pilots.jpg',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Scaffold Example'),
        ),
        drawer: Builder(
          builder: (context) => Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 95,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    cIndex = 0;
                    tabController.animateTo(cIndex);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                    'Image',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    cIndex = 1;
                    tabController.animateTo(cIndex);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: tabs,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image',
            ),
          ],
          onTap: onItemTapped,
          currentIndex: cIndex,
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.menu),
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        cIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      cIndex = index;
      tabController.animateTo(index);
    });
  }
}

class HeroExample extends StatelessWidget {
  const HeroExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'img',
              child: Image.asset(
                'assets/images/21_pilots.jpg',
                width: 400,
                height: 400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
