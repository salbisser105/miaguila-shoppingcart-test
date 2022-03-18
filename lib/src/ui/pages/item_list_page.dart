import 'package:flutter/material.dart';

import '../../../src/helpers/list_helper.dart';
import '../../../src/ui/widgets/item_list_widget.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List testItems = [];
  List shoppingCart = [];

  //Todo this was done for getting the data with a local json. I will leave it here for the moment.
  // Future<void> getData() async {
  //   final String response = await rootBundle.loadString('assets/sample.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data["items"];
  //     print(_items);
  //   });
  // }

  @override
  void initState() {
    testItems = ItemHelper().itemsHelper;
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
            testItems.isNotEmpty
                ? ItemsListWidget(
                    items: testItems,
                  )
                : Container()
          ],
        ));
  }
}
