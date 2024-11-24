import 'package:flutter/material.dart';

import 'hadeth_details.dart';
import 'hadeth_tab.dart';

class HadethTitle extends StatelessWidget {
  HadethChapter hadeth;

  HadethTitle(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
