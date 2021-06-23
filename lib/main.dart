import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:you/data/constants.dart';
import 'package:you/data/courses_inProgress.dart';
import 'package:you/data/drawermenu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: mainScreen(),
    );
  }
}

class mainScreen extends StatefulWidget {
  const mainScreen({Key key}) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int selectedMenuItem = 0;
  String name = "john";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerComponent(context),
      body: Container(
        color: Colors.amber,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SalutationBlock(name: name),
                StartLearningBlock(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Courses in progress",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            color: primaryTextColor),
                      ),
                    ],
                  ),
                ),
                for (var item in courses_inProgress)
                  Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * .9,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: primaryTextColor),
                                  ),
                                  Text(
                                    item.percentage.toString() + "%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: primaryTextColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              LinearProgressIndicator(
                                value: item.percentage / 100,
                                backgroundColor: Colors.black12,
                                valueColor:
                                    AlwaysStoppedAnimation(primaryTextColor),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer drawerComponent(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF232323),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "You",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.amber),
                ),
              ),
              Divider(
                color: Colors.white10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (var item in drawerMenuItems)
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedMenuItem = drawerMenuItems.indexOf(item);
                              Navigator.pop(context);
                            });
                          },
                          child: ListTile(
                            leading: IconTheme(
                              data: IconThemeData(
                                  color: drawerMenuItems.indexOf(item) ==
                                          selectedMenuItem
                                      ? Colors.amber
                                      : Colors.white10),
                              child: item.icon,
                            ),
                            title: Text(item.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: drawerMenuItems.indexOf(item) ==
                                                selectedMenuItem
                                            ? Colors.amber
                                            : Colors.white10)),
                          )),
                  ],
                ),
              ),
              Divider(
                color: Colors.white10,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMenuItem = -1;
                    });
                  },
                  child: ListTile(
                    leading: IconTheme(
                      data: IconThemeData(
                          color: selectedMenuItem == -1
                              ? Colors.amber
                              : Colors.white10),
                      child: Icon(Icons.logout),
                    ),
                    title: Text("Logout",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: selectedMenuItem == -1
                                ? Colors.amber
                                : Colors.white10)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SalutationBlock extends StatelessWidget {
  const SalutationBlock({
    Key key,
    @required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome back \n$name",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StartLearningBlock extends StatelessWidget {
  const StartLearningBlock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Start learning \nnow",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w800, color: primaryTextColor),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryTextColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("Courses"), Icon(Icons.arrow_forward)],
                ),
              ))
        ],
      ),
    );
  }
}
