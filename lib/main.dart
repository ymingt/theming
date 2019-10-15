import 'package:flutter/material.dart';
import 'content.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomNavigationBar Tutorial',
      theme: ThemeData(
        // appBarTheme: AppBarTheme(color: Colors.yellow),
        primarySwatch: Colors.red,
        // primaryColor: Color(0xFF003c7e),
        // accentColor: Color(0xFF4487c7),
        // brightness: Brightness.dark,
        // fontFamily: 'Roboto',
        // textTheme: TextTheme(
        //   body1: TextStyle(),
        //   body2: TextStyle(),
        // ).apply(
        //   bodyColor: Colors.orange,
        //   displayColor: Colors.blue,
        // ),
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => new MainPage(),
        '/screen1': (BuildContext context) => new Screen1(),
        '/screen2': (BuildContext context) => new Screen2(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ContentPage(title: "Home Page"),
    ContentPage(title: "Messages Page"),
    ContentPage(title: "Profile Page")
  ];

  void _onBottomNavBarTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter BottomNavigationBar Tutorial"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Flutter Team"),
              accountEmail: Text("flutter_team@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: Text(
                  "F",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Screen1"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/screen1');
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => NewPage("Page two")),
                // );
              },
            ),
            ListTile(
              title: Text("Screen2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/screen2');
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => NewPage("Page two")),
                // );
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }
}
