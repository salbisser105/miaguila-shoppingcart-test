import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.alertTitle,
    required this.contentText,
  }) : super(key: key);
  final String alertTitle;
  final String contentText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
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
                          alertTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const Divider(
                          color: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            contentText,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Row(
          children: const [
            Text('Go to CheckOut'),
            Icon(Icons.payment),
          ],
        ));
  }
}
