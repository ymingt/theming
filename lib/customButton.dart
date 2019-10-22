import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: Color(0xFF294499))),
      fillColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Text(
              "LEARN MORE",
              style: TextStyle(
                  color: Color(0xFF294499), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}
