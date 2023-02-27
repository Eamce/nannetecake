import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nannetecake/tabscreens/account.dart';
import 'package:nannetecake/tabscreens/cart.dart';
import 'package:nannetecake/tabscreens/history.dart';
import 'package:nannetecake/tabscreens/home.dart';

class Menu extends StatefulWidget {
  @override
    // TODO: implement createState
    _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var defFontSize = 12.0;
    if (width <= 400) {
      defFontSize = 10.0;
    }
    else {
      defFontSize = 12.0;
    }

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home, size: 25.0),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart, size: 25.0),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: new Stack(
                children: <Widget>[
                  new Icon(Icons.notifications),
                  new Positioned(
                    right: 0,
                    child: new Container(
                      padding: EdgeInsets.all(3),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: new Text('',
                        //'$counter',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              label: 'History'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person, size: 25.0),
              label: 'Account'
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue = CupertinoTabView();
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
//                child: ParkTrans(id:id,nameL:nameL,nameF:nameF,location:location),
                child: Home()
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CartScreen(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HistoryScreen(),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: AccountScreen(),
              );
            });
            break;
        }
        return returnValue;
      //  return returnValue;
      },
    );
  }
}
