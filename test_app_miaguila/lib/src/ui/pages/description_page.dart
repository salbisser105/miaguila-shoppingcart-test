import 'package:flutter/material.dart';
import 'package:test_app_miaguila/bloc_navigator.dart';
import 'package:test_app_miaguila/src/ui/pages/item_list_page.dart';

import '../widgets/custom_button_widget.dart';

class DescriptionPage extends StatelessWidget {
  final String title;
  final String description;
  final String urlImage;
  final double price;
  const DescriptionPage(
      {Key? key,
      required this.title,
      required this.description,
      required this.urlImage,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                urlImage,
                height: 200.0,
                width: 100,
              )),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.0),
          // child: Image.network(
          //   urlImage,
          //   height: 200.0,
          //   width: 100,
          //   ),
          // ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(title)),
                        const CustomButtonWidget(
                            text: 'Agregar al carrito', height: 50, width: 100),
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
                        description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 15.0),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
