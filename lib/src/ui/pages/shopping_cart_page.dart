import 'package:flutter/material.dart';

import '../../../bloc_navigator.dart';
import '../widgets/dialog_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key, required this.cartItems}) : super(key: key);
  final List cartItems;

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List itemsToBuy = blocNavigator.shoppingCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text('Your Cart'),
            Text('${blocNavigator.shoppingCart.length}  Items',
                style: Theme.of(context).textTheme.caption),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Add \$40.0 for FREE delivery',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ))),
              ],
            ),
            ItemsContent(itemsToBuy: itemsToBuy),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const DialogWidget(
                    alertTitle: 'Checkout is under construction.',
                    contentText:
                        'Thanks for using the application. Right now, the checkout is being developed'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        itemsToBuy.clear();
                      });
                    },
                    child: Row(
                      children: const [
                        Text('Delete all'),
                        Icon(Icons.delete_forever),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemsContent extends StatefulWidget {
  const ItemsContent({
    Key? key,
    required this.itemsToBuy,
  }) : super(key: key);

  final List itemsToBuy;

  @override
  State<ItemsContent> createState() => _ItemsContentState();
}

class _ItemsContentState extends State<ItemsContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.itemsToBuy.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                height: 150,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(
                            widget.itemsToBuy[index]["title"],
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                            'Precio: ${widget.itemsToBuy[index]["price"]} USD'),
                        const SizedBox(height: 15),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.itemsToBuy
                                    .remove(widget.itemsToBuy[index]);
                              });
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                      color: Colors.red,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 40.0, bottom: 40.0),
                      width: MediaQuery.of(context).size.width / 3,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.itemsToBuy[index]["image"],
                            fit: BoxFit.contain,
                          )),
                    )
                  ],
                ),
              );
            }));
  }
}
