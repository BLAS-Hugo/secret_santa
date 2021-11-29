
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:party_app/view/draw/draw_tab.dart';
import 'package:party_app/view/home/home_tab.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;

  Widget buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white.withOpacity(0.6),
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote_outlined),
            activeIcon: Icon(Icons.how_to_vote),
            label: "Tirage"
        ),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.mail),
            activeIcon: Icon(CupertinoIcons.mail_solid),
            label: "Chat"
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Papa Noel"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: DrawTab(),
      bottomNavigationBar: buildBottomBar(),
    );
  }
}