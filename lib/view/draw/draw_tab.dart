

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawTab extends StatefulWidget {
  final _DrawTabState _drawTabState = _DrawTabState();

  DrawTab({Key? key}) : super(key: key);

  @override
  _DrawTabState createState() => _DrawTabState();

  void callDoubleTapAction() {
    _drawTabState.doubleTapAction();
  }
}

class _DrawTabState extends State<DrawTab> {

  ScrollController sc = ScrollController();
  List<Widget> eventList = [Container(), Container()];

  void doubleTapAction() {
    try {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      print("ERROR WHILE GETTING THE NAVIGATOR ON HOME PAGE: $e");
    }
  }

  /// Builds the list of Events
  List<Widget> buildList() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> list = [
      ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(height / 69), topRight: Radius.circular(height / 69)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            child: Center(
              child: Text(
                "Events",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),
            ),
            height: height / 15,
            width: width,
            decoration: BoxDecoration(color: Colors.green.shade300),
          ),
        ),
      )];
    for(int i = 0; i <= eventList.length; i++) {
      if(i != 0) {
        list.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            thickness: 1,
            color: Colors.green.shade300,
          ),
        ));
      }
      list.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                print("Info page pushed !");
              },
              child: Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Noel",
                              style: TextStyle(color: Color(0xff1E9310))
                          ),
                          SizedBox(height: 2),
                          Text(
                              "24 décembre 2021",
                              style: TextStyle(color: Color(0xff1E9310))
                          ),
                          SizedBox(height: 2),
                          Text(
                              "Dans 28 jours",
                              style: TextStyle(color: Color(0xff1E9310))
                          )
                        ],
                      ),
                    ),
                    Expanded(child: Container(
                      height: height / 15,
                      child: Text("   "),
                    )),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Color(0xff1E9310),
                    )
                  ],
                ),
              ),
            ),
          )
      );
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scrollbar(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: sc,
          child: Container(
            height: height,
            width: width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 15,
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height / 70),
                          color: Colors.red
                      ),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      height: height / 6,
                      width: width - 40,
                      child: Center(
                        child: Text(
                            "Nouveau tirage",
                            textAlign: TextAlign.start ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  Container(height: height / 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Colors.green.shade300
                          ),
                          borderRadius: BorderRadius.circular(height / 60)
                      ),
                      child: Column(
                          children: buildList()
                      ),
                    ),
                  ),
                  Container(height: height / 10)
                ],
              ),
            ),
          ),
        )
    );
  }
}
