
import 'package:flutter/material.dart';
import 'home.dart';
import 'search.dart';
import 'favo.dart';
import 'Tips.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageno=0;
  List<Widget> screens =[
    Dashboard(),
    Cart(),
    fav(),
    tips(),


  ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(



          body: screens[_pageno],
          bottomNavigationBar: GNav(
            selectedIndex: _pageno,
            onTabChange: (index) {
              setState(() {
                _pageno=index;
              });
            },

            tabs: [
              GButton(

                    icon: Icons.home_sharp,
                    iconActiveColor: Colors.red,
                text: 'Home',
                  ),

              GButton(

                icon: Icons.search_sharp,
                iconActiveColor: Colors.red,
                text: 'Explore',
              ),
              GButton(

                icon: Icons.favorite_rounded,
                iconActiveColor: Colors.red,
                text: 'Favorite',
              ),
              GButton(

                icon: Icons.menu_book_outlined,
                iconActiveColor: Colors.red,
                text: 'Tips',
              ),
            ],
          ),


        );
  }
}
