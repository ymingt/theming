import 'package:flutter/material.dart';

class LayoutThemeContainer extends StatefulWidget {
  @override
  LayoutThemeState createState() => LayoutThemeState();
  final Widget child;
  final ThemeData themeData;
  final Color fsmButtonColor;
  LayoutThemeContainer({this.child, this.themeData, this.fsmButtonColor});
  static _InheritedStateContainer of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
        as _InheritedStateContainer);
  }
}

class LayoutThemeState extends State<LayoutThemeContainer> {
  ThemeData themeData;
  Color fsmButtonColor;
  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      child: widget.child,
      themeData: widget.themeData,
      fsmButtonColor: widget.fsmButtonColor,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final ThemeData themeData;
  final Color fsmButtonColor;

  _InheritedStateContainer({
    Key key,
    @required this.themeData,
    this.fsmButtonColor,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
