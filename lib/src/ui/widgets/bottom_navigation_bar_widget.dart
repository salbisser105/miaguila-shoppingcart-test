import 'package:flutter/material.dart';

import '../../../bloc_navigator.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({this.currentIndex = 0, Key? key})
      : super(key: key);

  final int currentIndex;

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final List<BottomNavigationBarItem> items = [];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      onTap: (index) {
        setState(() {
          blocNavigator.bottomItemNavigationAction(index);
        });
      },
      currentIndex: blocNavigator.currentBottomItemsIndex(),
      items: blocNavigator.listBottomNavigationBarItems(),
    );
  }
}
