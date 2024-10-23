import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/allusers.dart';
import 'food.dart';
import 'adminweb.dart';

class adminhome extends StatefulWidget {
  const adminhome({super.key});

  @override
  State<adminhome> createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  int pages=0;
  List<Widget> page=[
    food(),
    webs(),
    allusers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[pages],
      bottomNavigationBar: GNav(
        selectedIndex: pages,
        onTabChange: (index){
          setState(() {
            pages=index;
          });
        },
        tabs: [
          GButton(icon:Icons.cake,
          iconActiveColor: Colors.red,text: " Food" ,),



          GButton(icon:Icons.menu_book,
            iconActiveColor: Colors.red,text: " Tip" ,),

          GButton(icon:Icons.perm_contact_cal_outlined,
            iconActiveColor: Colors.red,text: " Users" ,),

        ],
      ),

    );
  }
}
