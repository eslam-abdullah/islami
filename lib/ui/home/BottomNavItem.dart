import 'package:flutter/material.dart';
import 'package:islami/ui/theme/MyTheme.dart';
import 'package:islami/ui_utils.dart';

class BottomNavItem extends BottomNavigationBarItem {
  BottomNavItem(String title, String iconPath)
      : super(
            icon: ImageIcon(AssetImage(getFullPathImage(iconPath))),
            label: title,
            backgroundColor: MyThemeData.lightPrimary);
}
