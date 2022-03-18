import 'package:flutter/material.dart';
import '../../../bloc_navigator.dart';
import '../../../src/ui/pages/item_list_page.dart';

import '../widgets/custom_button_widget.dart';

class DescriptionPage extends StatelessWidget {
  final String title;
  final String description;
  final String urlImage;
  final double price;
  final List shoppingCart;
  const DescriptionPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.urlImage,
      required this.shoppingCart,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mi Aguila Shop'),
        leading: IconButton(
            onPressed: () {
              blocNavigator.routeTo(
                  namePage: 'items list', page: const ItemListPage());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: BodyWidget(
        urlImage: urlImage,
        title: title,
        description: description,
        price: price,
        shoppingCart: shoppingCart,
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({
    Key? key,
    required this.urlImage,
    required this.title,
    required this.description,
    required this.shoppingCart,
    required this.price,
  }) : super(key: key);

  final String urlImage;
  final String title;
  final String description;
  final double price;
  final List shoppingCart;

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
              widget.urlImage,
              height: 200.0,
              width: 100,
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(widget.title)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                      width: 250,
                                      height: 350,
                                      child: Column(
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            radius: 50.0,
                                            child: Icon(Icons.dangerous,
                                                color: Colors.red, size: 70.0),
                                          ),
                                          Text(
                                            'We are having troubles with our add function in this page.',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          const Divider(
                                            color: Colors.red,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Sorry for the trouble our team is working on the solution. Please add your item from the item List',
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          });
                          //TODO fix, error when adding the item to the cart.

                          // blocNavigator.shoppingCart = widget.shoppingCart;
                        },
                        child: const CustomButtonWidget(
                            text: 'Agregar al carrito', height: 50, width: 100),
                      ),
                    ]),
                const SizedBox(height: 65.0),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.justify,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 15.0),
                    ))
              ],
            ))
      ],
    );
  }
}
