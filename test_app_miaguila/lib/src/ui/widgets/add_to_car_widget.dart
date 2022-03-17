import 'package:flutter/material.dart';
import 'package:test_app_miaguila/src/ui/widgets/custom_button_widget.dart';

class AddToCarWidget extends StatelessWidget {
  const AddToCarWidget({Key? key, required this.amount}) : super(key: key);

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 80,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '\$$amount',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            const CustomButtonWidget(
              text: 'Add to cart',
              height: 50.0,
              width: 150.0,
            ),
            const SizedBox(width: 20.0)
          ],
        ),
      ),
    );
  }
}
