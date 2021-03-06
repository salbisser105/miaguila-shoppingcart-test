import 'package:flutter/material.dart';

import '../../bloc_central.dart';
import 'src/ui/widgets/router_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BlocCentral _blocCentral;
  @override
  void initState() {
    _blocCentral = blocCentral;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RouterWidget(),
    );
  }
}
