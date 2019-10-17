import 'package:flutter/material.dart';
// import 'content.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'themes.dart';
import 'customTheme.dart';

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: Main(),
    ),
  );
}

// void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.of(context),
      // theme: ThemeData(
      // appBarTheme: AppBarTheme(color: Colors.yellow),
      // primarySwatch: Colors.red,
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
      // ),
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
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  // int _currentIndex = 0;
  // final List<Widget> _children = [
  //   ContentPage(title: "Home Page"),
  //   ContentPage(title: "Messages Page"),
  //   ContentPage(title: "Profile Page")
  // ];

  // void _onBottomNavBarTab(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  bool _value2Switch = false;

  void _onChanged2(bool value) => {
        if (value)
          {
            _changeTheme(context, MyThemeKeys.DARKER),
          }
        else
          {
            _changeTheme(context, MyThemeKeys.LIGHT),
          },
        setState(() => _value2Switch = value)
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Theming"),
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
                // Navigator.of(context).pushNamed('/screen1');
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
                // Navigator.of(context).pushNamed('/screen2');
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //       builder: (BuildContext context) => NewPage("Page two")),
                // );
              },
            ),
          ],
        ),
      ),
      // body: _children[_currentIndex],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              new SwitchListTile(
                value: _value2Switch,
                onChanged: _onChanged2,
                title: new Text('Dark Theme'),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: _onBottomNavBarTab,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Home'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mail),
      //       title: Text('Messages'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text('Profile'),
      //     )
      //   ],
      // ),
    );
  }
}

// import 'customTheme.dart';
// import 'home.dart';
// import 'package:flutter/material.dart';
// import 'themes.dart';

// void main() {
//   runApp(
//     CustomTheme(
//       initialThemeKey: MyThemeKeys.LIGHT,
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dynamic themes demo',
//       theme: CustomTheme.of(context),
//       home: HomeScreen(),
//     );
//   }
// }
