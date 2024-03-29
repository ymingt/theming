import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class Screen1 extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Screen1> {
  bool _value1 = false;
  bool _value2 = false;
  SingingCharacter _character = SingingCharacter.lafayette;

  bool _value2Switch = false;

  void _onChanged2(bool value) => setState(() => _value2Switch = value);

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.orange[200],
          displayColor: Colors.orange[200],
        );

    ThemeData theme = Theme.of(context);
    TextTheme partialTheme = TextTheme(
      display1: TextStyle(color: Colors.green),
      title: TextStyle(color: Colors.blueGrey),
    );
    theme = theme.copyWith(
      textTheme: theme.textTheme.merge(partialTheme),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                'Text - copyWith',
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.lightBlueAccent),
              ),
              Text(
                'Text - apply',
                style: newTextTheme.display1,
              ),
              Text(
                'Text - merge',
                style: theme.textTheme.title,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              new Checkbox(value: _value1, onChanged: _value1Changed),
              new CheckboxListTile(
                value: _value2,
                onChanged: _value2Changed,
                title: new Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text('TGIF'),
                secondary: new Icon(Icons.archive),
              ),
              ListTile(
                title: const Text('Lafayette'),
                leading: Radio(
                  value: SingingCharacter.lafayette,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio(
                  value: SingingCharacter.jefferson,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              new SwitchListTile(
                value: _value2Switch,
                onChanged: _onChanged2,
                title: new Text('Hello World'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
