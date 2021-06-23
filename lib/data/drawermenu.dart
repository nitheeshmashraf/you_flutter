import 'package:flutter/material.dart';

class menuItem {
  final String title;
  final Icon icon;
  menuItem({this.title, this.icon});
}

List<menuItem> drawerMenuItems = [
  menuItem(title: "Home", icon: Icon(Icons.home)),
  menuItem(title: "Courses", icon: Icon(Icons.book_online)),
  menuItem(title: "Articles", icon: Icon(Icons.article)),
  menuItem(title: "Profile", icon: Icon(Icons.face)),
  menuItem(title: "become a memeber", icon: Icon(Icons.card_membership)),
];
