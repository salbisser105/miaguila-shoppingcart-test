import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_miaguila/src/models/product_model.dart';
import 'package:test_app_miaguila/src/ui/widgets/item_list_widget.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  late Future<ProductModel> futureListItemsApi;
  List _items = [];
  Future<void> getData() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Items on sale')),
        ),
        body: Column(
          children: [
            _items.isNotEmpty ? ItemsListWidget(items: _items) : Container()
          ],
        ));
   
  }
}