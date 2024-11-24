import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/theme/MyTheme.dart';
import 'package:islami/ui_utils.dart';

import 'hadeth_title.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => HadethTabState();
}

class HadethTabState extends State<HadethTab> {
  List<HadethChapter> allHadeth = [];

  @override
  void initState() {
    super.initState();
    readHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(getFullPathImage('hadeth_header.png')),
        Container(
          width: double.infinity,
          height: 2,
          color: MyThemeData.lightPrimary,
        ),
        Text(
          'الأحاديث',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            // fontWeight: FontWeight.w700
          ),
        ),
        Container(
          width: double.infinity,
          height: 2,
          color: MyThemeData.lightPrimary,
        ),
        Expanded(
          child: allHadeth.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    return HadethTitle(allHadeth[index]);
                  },
                  itemCount: allHadeth.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 2,
                      // margin: EdgeInsets.symmetric(horizontal: 20),
                      color: MyThemeData.lightPrimary,
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    );
  }

  void readHadethFile() async {
    String fileContent = await rootBundle.loadString("assets/files/hadeth.txt");
    List<String> seperatedHadeth = fileContent.split("#");

    for (int i = 0; i < seperatedHadeth.length; i++) {
      String singleHadeth = seperatedHadeth[i];
      List<String> lines = singleHadeth.trim().split("\n");
      String title = lines[0];
      lines.removeAt(0);
      String content = lines.join("\n");
      HadethChapter h = HadethChapter(title, content);
      allHadeth.add(h);
    }
    setState(() {});
  }
}

class HadethChapter {
  String title;
  String content;

  HadethChapter(this.title, this.content);
}