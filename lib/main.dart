import 'package:flutter/material.dart';
// import 'content.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'themes.dart';
import 'customTheme.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'customButton.dart';
// import 'cTheme.dart' as Theme;

void main() => runApp(MainWithTheme());

class MainWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      // builder: (_) => ThemeChanger(Theme.companyThemeData,),
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
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

enum ThemeSelection { light, dark, custom }

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

  ThemeSelection _currentTheme = ThemeSelection.light;

  bool _value2Switch = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    void _onChanged2(bool value) => {
          if (value)
            {
              _themeChanger.setTheme(ThemeData.dark()),
            }
          else
            {
              _themeChanger.setTheme(ThemeData.light()),
            },
          // setState(() => _value2Switch = value)
        };
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
              // ListTile(
              //   title: const Text('Light'),
              //   leading: Radio(
              //     value: ThemeSelection.light,
              //     groupValue: _currentTheme,
              //     onChanged: (ThemeSelection value) {
              //       _changeTheme(context, MyThemeKeys.LIGHT);
              //       setState(() {
              //         _currentTheme = value;
              //       });
              //     },
              //   ),
              // ),
              // ListTile(
              //   title: const Text('Dark'),
              //   leading: Radio(
              //     value: ThemeSelection.dark,
              //     groupValue: _currentTheme,
              //     onChanged: (ThemeSelection value) {
              //       _changeTheme(context, MyThemeKeys.DARKER);
              //       setState(() {
              //         _currentTheme = value;
              //       });
              //     },
              //   ),
              // ),
              // ListTile(
              //   title: const Text('Custom'),
              //   leading: Radio(
              //     value: ThemeSelection.custom,
              //     groupValue: _currentTheme,
              //     onChanged: (ThemeSelection value) {
              //       _changeTheme(context, MyThemeKeys.CUSTOM);
              //       setState(() {
              //         _currentTheme = value;
              //       });
              //     },
              //   ),
              // ),

              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.lightTheme),
                child: Text('Light'),
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.darkerTheme),
                child: Text('Dark'),
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.customTheme),
                child: Text('Custom'),
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.limeTheme),
                color: Colors.lime,
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.cyanTheme),
                color: Colors.cyan,
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.amberTheme),
                color: Colors.amber,
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.indigoTheme),
                color: Colors.indigo,
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.brownTheme),
                color: Colors.brown,
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.greenTheme),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: () => _themeChanger.setTheme(MyThemes.pinkTheme),
                color: Colors.pink,
              ),
              CustomButton(
                onPressed: () {
                  print("Tapped Me");
                },
              )
              // RaisedButton(
              //   onPressed: () {
              //     print('CustomTheme.of(context), ${CustomTheme.of(context)}');
              //     CustomTheme.of(context);
              //   },
              //   child: const Text('Enabled Button',
              //       style: TextStyle(fontSize: 20)),
              // ),
              // new SwitchListTile(
              //   value: _value2Switch,
              //   onChanged: _onChanged2,
              //   title: new Text('Dark Theme'),
              // )
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
