import 'package:flutter/material.dart';

class LayoutThemeContainer extends StatefulWidget {
  @override
  LayoutThemeState createState() => LayoutThemeState();
  final Widget child;
  LayoutThemeContainer({this.child});
  static LayoutThemeState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }
}

class LayoutThemeState extends State<LayoutThemeContainer> {
  // Add all your theme properties and logic here:
  double get spacingUnit => 10.0;
  Color get fsmColor => Colors.red;
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final LayoutThemeState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
