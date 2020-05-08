import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            CostomBody(),
            CostomAppBar(),
            NavBar(),
          ],
        ),
      ),
    );
  }
}

class CostomBody extends StatelessWidget {
  const CostomBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Section(
              headline: 'Meditation',
              description: 'discover happiness',
              img: 'assets/img/desert.jpg',
            ),
            Section(
              headline: 'Sensetions',
              description: 'feel the moment',
              img: 'assets/img/galaxy.jpg',
            ),
          ],
        ),
        Center(
          child: ClipPath(
            clipper: MidClipper(),
            child: Section(
              headline: 'Daydream',
              description: 'go beyond the form',
              img: 'assets/img/beach.jpg',
            ),
          ),
        ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  const Section({this.headline, this.description, this.img});
  final headline;
  final description;
  final img;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(img),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: headline,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: description,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavIcon(icon: Icons.bubble_chart, active: false),
              SizedBox(width: 1),
              NavIcon(icon: Icons.landscape, active: true),
              SizedBox(width: 1),
              NavIcon(icon: Icons.brightness_3, active: false),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Focus',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 1),
              Text(
                'Relax',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 1),
              Text(
                'Sleep',
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(0, sh * 0.3, sw, sh * 0.2, sw, sh * 0.45);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.55);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class NavIcon extends StatelessWidget {
  NavIcon({this.icon, this.active});
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xff1e1e1e),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
          child: Icon(icon, color: active ? Colors.black87 : Colors.white),
        ),
      ),
    );
  }
}

class CostomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 175,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black87, Colors.transparent]),
        ),
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xff604848)),
            ),
            Positioned(
              top: 30,
              left: MediaQuery.of(context).size.width / 2 - 25,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.shade100,
                  ),
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('assets/img/face.jpeg'),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 75,
              left: MediaQuery.of(context).size.width / 2 - 10,
              child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child:
                      FittedBox(child: Icon(Icons.add, color: Colors.black87))),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => print('Print'),
                    icon: Icon(
                      Icons.wifi_tethering,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () => print('Print'),
                    icon: Icon(Icons.notifications, color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(0, sh);
    path.lineTo(4 * sw / 12, sh);
    path.cubicTo(5 * sw / 12, sh, 5 * sw / 12, sh / 2, 6 * sw / 12, sh / 2);
    path.cubicTo(7 * sw / 12, sh / 2, 7 * sw / 12, sh, 8 * sw / 12, sh);
    path.lineTo(sw, sh);
    path.lineTo(sw, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
