import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadingCategory(BuildContext context) {
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