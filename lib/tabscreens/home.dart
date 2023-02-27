import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nannetecake/globals/globalvars.dart';
import 'package:nannetecake/products/searchproducts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:nannetecake/globals/images.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var size = MediaQuery.of(context).size;
    var appBarSize = AppBar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    GlobalVars.homescreenContext = context;
    return Container(
        child: Column(
            children: [
              Container(height: safePadding, color:  Colors.deepOrangeAccent),
              Container(
                color: Colors.deepOrangeAccent,
              //   color: Colors.white,
                alignment: Alignment.center,
                height: appBarSize,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                      child: Center(
                        child: Image.asset(
                          Images.logo,
                          width: 30,
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.deepOrangeAccent,
                      child: InkWell(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                          child: Container(
                            width: size.width - 60,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                // color: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(CupertinoIcons.search,
                                        color: Colors.grey)),
                                Text("Search here...",
                                    style: TextStyle(color: Colors.grey))
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: SearchProducts()));
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ]
        )
    );
  }
  Widget loadingCategory() {
    var size = MediaQuery.of(context).size;
    var appBarSize = AppBar().preferredSize.height;
    return Container(
      height: appBarSize + 60,
      width: size.width,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: index != 9
                  ? const EdgeInsets.only(left: 3, top: 3, bottom: 3)
                  : const EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
              child: Container(
                width: appBarSize + 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Center(
                        child: CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black12)),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}