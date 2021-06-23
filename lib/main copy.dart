import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  List<String> menuItems = [
    "Home",
    "Courses",
    "Articles",
    "Profile",
    "Premium"
  ];
  static const _iconTypes = <IconData>[
    Icons.home,
    Icons.book,
    Icons.art_track,
    Icons.face,
    Icons.verified,
    Icons.equalizer_rounded,
  ];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return drawerComponent(size, context);
  }

  Scaffold drawerComponent(Size size, BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xFFfa7f72)),
          ),
          SafeArea(
            child: Container(
              width: size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    child: Text(
                      "You",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView(children: [
                      for (var item in menuItems)
                        GestureDetector(
                          onTap: () {
                            print("Clicked on $item");
                            setState(() {
                              selectedItem = menuItems.indexOf(item);
                              value = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  _iconTypes[menuItems.indexOf(item)],
                                  color: menuItems.indexOf(item) == selectedItem
                                      ? Colors.white
                                      : Colors.white38,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "$item",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            color: menuItems.indexOf(item) ==
                                                    selectedItem
                                                ? Colors.white
                                                : Colors.white38),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      Divider(
                        color: Colors.white,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Clicked on Logout");
                          setState(() {
                            selectedItem = -1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  "Logout",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              value = 0;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 300),
              builder: (_, double val, __) {
                return (Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val),
                  child: screens(size, context),
                ));
              }),
        ],
      ),
    );
  }

  Scaffold screens(Size size, BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                  Color(0xFFfa7f72),
                  Color(0xFFfa7f72),
                  Colors.white70,
                  Colors.white70
                ])),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                value == 0 ? value = 1 : value = 0;
                              });
                            }),
                      ],
                    ),
                    Text(
                      "Welcome back",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "John Doe",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: SizedBox(
                              height: 150.0,
                              width: size.width * 0.9,
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Start learning now!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.blueGrey[800]),
                                  ),
                                  Container(
                                    width: size.width * 0.5,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 10.0),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFfa7f72),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Courses",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(color: Colors.white)),
                                        Icon(
                                          Icons.arrow_forward_sharp,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Courses in progress",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.blueGrey[800]),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: size.width * .8,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20.0)),
                    )
                  ]),
            )));
  }
}
