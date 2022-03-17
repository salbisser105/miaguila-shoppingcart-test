import 'package:flutter/material.dart';
import 'package:test_app_miaguila/bloc_navigator.dart';
import 'package:test_app_miaguila/src/ui/pages/description_page.dart';
import 'package:test_app_miaguila/src/ui/widgets/add_to_car_widget.dart';
import 'package:test_app_miaguila/src/ui/widgets/custom_button_widget.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({
    Key? key,
    required List items,
  })  : _items = items,
        super(key: key);

  final List _items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              blocNavigator.routeTo(
                  namePage: 'description',
                  page: DescriptionPage(
                    title: _items[index]["title"],
                    description: _items[index]["description"],
                    urlImage: _items[index]["image"],
                    price: _items[index]["price"],
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
                          _items[index]["title"],
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text('Precio: ${_items[index]["price"]} USD'),
                      const SizedBox(height: 15),
                      const CustomButtonWidget(
                          text: 'Agregar al carrito', height: 50, width: 100)
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          _items[index]["image"],
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
