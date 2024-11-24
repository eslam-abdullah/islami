import 'package:flutter/material.dart';
import 'package:islami/ui/home/hadeth_tab.dart';
import 'package:islami/ui/home/radio_tab.dart';
import 'package:islami/ui/home/tasbeh_tab.dart';

import 'BottomNavItem.dart';
import 'default_screen.dart';
import 'quraan_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

var tabs = [QuraanTab(), HadethTab(), TasbehTab(), RadioTab()];

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Islami'),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavItem("Quran", '1.0x/icon_quran.png'),
            BottomNavItem("Hadeth", '1.0x/icon_hadeth.png'),
            BottomNavItem("Sebha", '1.0x/icon_sebha.png'),
            BottomNavItem("Radio", '1.0x/icon_radio.png'),
          ],
        ),
      ),
    );
  }
}
