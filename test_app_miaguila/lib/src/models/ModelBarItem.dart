import 'package:flutter/material.dart';

class ModelBarItem {
  final String namePage, label;
  final Widget page;
  final Function? function;
  final IconData icon;

  ModelBarItem(
      {required this.namePage,
      required this.label,
      required this.page,
      this.function,
      required this.icon});
}
