import 'package:flutter/material.dart';

class FsmButton extends StatelessWidget {
  final String buttonText;
  final bool disabled;
  final Color color;
  final Function onPress;
  FsmButton(
      {Key key,
      @required this.buttonText,
      this.disabled,
      this.color,
      this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: Text(buttonText),
      color: color,
      onPressed: disabled ? null : onPress,
    );
  }
}
