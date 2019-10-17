import 'package:flutter/material.dart';
import 'customTheme.dart';
import 'themes.dart';

enum SingingCharacter { lafayette, jefferson }

class Screen1 extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Screen1> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  bool _value1 = false;
  bool _value2 = false;
  SingingCharacter _character = SingingCharacter.lafayette;

  bool _value1Switch = false;
  bool _value2Switch = false;

  void _onChanged1(bool value) => setState(() => _value1Switch = value);
  void _onChanged2(bool value) => setState(() => _value2Switch = value);

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void _value1Changed(bool value) => {
        _changeTheme(context, MyThemeKeys.DARKER),
        setState(() => _value1 = value)
      };
  void _value2Changed(bool value) => setState(() => _value2 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen1"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text('Screen1'),
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
                subtitle: new Text('Subtitle'),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.red,
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
              new Switch(value: _value1Switch, onChanged: _onChanged1),
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
