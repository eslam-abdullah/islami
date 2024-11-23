import 'package:flutter/material.dart';
import 'package:islami/ui_utils.dart';

class DefaultScreen extends StatelessWidget {
  Widget body;

  DefaultScreen({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Image.asset(getFullPathImage('background.png')), body],
    );
  }
}
