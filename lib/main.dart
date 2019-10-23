import 'package:flutter/material.dart';
// import 'content.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'themes.dart';
import 'customTheme.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'layoutThemeContainer.dart';
import 'fsmButton.dart';

void main() => runApp(MainWithTheme());

class MainWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.light()),
      child: LayoutThemeContainer(
        themeData: ThemeData.dark(),
        fsmButtonColor: Colors.blue,
        child: Main(),
      ),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LayoutThemeContainer.of(context).themeData,
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
        };
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Theming"),
      ),
      drawer: Drawer(
        child: ListView(
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
              },
            ),
            ListTile(
              title: Text("Screen2"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
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
              FsmButton(
                buttonText: "FSMButton",
                disabled: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
