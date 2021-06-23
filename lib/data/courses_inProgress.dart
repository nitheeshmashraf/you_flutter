import 'package:flutter/material.dart';

class courses {
  final String title, url;
  final double percentage;
  courses({this.title, this.percentage, this.url});
}

List<courses> courses_inProgress = [
  courses(title: "Thermodynamics", percentage: 80, url: ""),
  courses(title: "Mechanics", percentage: 40, url: ""),
  courses(title: "TOC", percentage: 60, url: ""),
  courses(title: "Mathematics", percentage: 87, url: ""),
  courses(title: "Physics", percentage: 90, url: ""),
  courses(title: "Civil", percentage: 8, url: ""),
];
