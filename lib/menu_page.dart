// ignore_for_file: prefer_const_constructors

import 'package:eventgo/pages/add_eventpage.dart';
import 'package:eventgo/pages/homepage.dart';
import 'package:eventgo/pages/scan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AddEvent(),
    ScanPage(),
    // SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(currentIndex),
        bottomNavigationBar:
            //  currentIndex != 1
            //     ?
            Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            selectedItemColor: Theme.of(context).colorScheme.onBackground,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.compass,
                ),
                label:"Explorer"
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.plus_circle,
                ),
                label: "Add Event"
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.qrcode_viewfinder,
                ),
                label: "Scanner",
              ),

            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        )
        // : null,
        );
  }
}
