import 'package:flutter/material.dart';
import 'package:test_app_miaguila/bloc_navigator.dart';
import 'package:test_app_miaguila/src/ui/pages/item_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              blocNavigator.routeTo(namePage: 'itemList', page: const ItemListPage());
              print('onpress');
            },
            child: Container(
              height: 80,
              width: 90,
              color: Colors.red,
              child: Text('Item List'),
            ),
          ),
          Center(
            child: Text('HomePage'),
          ),
        ],
      ),
    );
  }
}