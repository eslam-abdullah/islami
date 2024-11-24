import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/default_screen.dart';
import 'package:islami/ui/home/verse_content.dart';
import 'package:islami/ui/theme/MyTheme.dart';

class ChapterDetails extends StatefulWidget {
  static const String routeName = 'ChapterDetails';

  @override
  State<ChapterDetails> createState() => ChapterDetailsState();
}

class ChapterDetailsState extends State<ChapterDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    ChapterDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
    if (verses.isEmpty) readFileData(args.chapterIndex);

    return DefaultScreen(
      body: Scaffold(
          appBar: AppBar(
            title: Text(args.chapterTitle),
          ),
          body: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            elevation: 24,
            margin: EdgeInsets.symmetric(vertical: 64, horizontal: 24),
            child: verses.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return VerseContent(index, verses[index]);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (context, index) => Container(
                      color: MyThemeData.lightPrimary,
                      height: 1,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 64),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          )),
    );
  }

  void readFileData(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString("assets/files/${fileIndex + 1}.txt");
    List<String> lines = fileContent.trim().split("\n");
    setState(() {
      verses = lines;
    });
  }
}

class ChapterDetailsArgs {
  int chapterIndex;
  String chapterTitle;

  ChapterDetailsArgs(this.chapterIndex, this.chapterTitle);
}
