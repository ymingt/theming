import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  ContentPage({@required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[Text(title)],
        ),
      ),
    );
  }
}
