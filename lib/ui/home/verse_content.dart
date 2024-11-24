import 'package:flutter/material.dart';

class VerseContent extends StatelessWidget {
  int index;
  String content;

  VerseContent(this.index, this.content);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        '$content {${index + 1}}',
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
