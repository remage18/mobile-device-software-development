import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterAnimations",
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _curveAnimation;

  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late ColorTween _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));

    _curveAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _rotateAnimation = Tween(begin: 0.0, end: 0.15).animate(_curveAnimation);

    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(_curveAnimation);

    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Animations"),
      ),
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 200,
          height: 100,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(
            left: 75,
            top: _slideAnimation.value,
          ),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: Center(
              child: Text(
                'Animation',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: _colorAnimation.evaluate(_curveAnimation)),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
