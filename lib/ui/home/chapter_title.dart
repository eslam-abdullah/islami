import 'package:flutter/material.dart';
import 'package:islami/ui/home/chapter_details.dart';
import 'package:islami/ui/home/quraan_tab.dart';
import 'package:islami/ui/theme/MyTheme.dart';

class ChapterTitle extends StatelessWidget {
  int index;
  String title;

  ChapterTitle(this.index, this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChapterDetails.routeName,
            arguments: ChapterDetailsArgs(index, title));
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              QuraanChapters.number[index].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            height: 39,
            width: 2,
            color: MyThemeData.lightPrimary,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
