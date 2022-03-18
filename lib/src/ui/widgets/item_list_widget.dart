import 'package:flutter/material.dart';

import '../../../bloc_navigator.dart';
import '../../../src/ui/pages/description_page.dart';
import '../../../src/ui/widgets/custom_button_widget.dart';

class ItemsListWidget extends StatefulWidget {
  const ItemsListWidget({
    Key? key,
    required List items,
  })  : _items = items,
        super(key: key);

  final List _items;

  @override
  State<ItemsListWidget> createState() => _ItemsListWidgetState();
}

class _ItemsListWidgetState extends State<ItemsListWidget> {
  List shoppingCart = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget._items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              blocNavigator.routeTo(
                  namePage: 'description',
                  page: DescriptionPage(
                    title: widget._items[index]["title"],
                    description: widget._items[index]["description"],
                    urlImage: widget._items[index]["image"],
                    price: widget._items[index]["price"],
                    shoppingCart: shoppingCart,
                  ));
            },
            child: Container(
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
                          widget._items[index]["title"],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text('Precio: ${widget._items[index]["price"]} USD'),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          shoppingCart.add(widget._items[index]);
                          blocNavigator.shoppingCart = shoppingCart;
                          setState(() {});
                        },
                        child: const CustomButtonWidget(
                          text: 'Agregar al carrito',
                          height: 50,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget._items[index]["image"],
                          fit: BoxFit.contain,
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
