import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/favo.dart';

class details extends StatefulWidget {
  final String image;
  final String Foodname;
  final String Incredients;
  final String Recepie;

  details({
    required this.image,
    required this.Foodname,
    required this.Incredients,
    required this.Recepie,
  });

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  bool isFavorite = false;

  void initState() {
    super.initState();
    checkFavstatus();
  }

  Future<void> checkFavstatus() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('MyFavourites')
        .where('Foodname', isEqualTo: widget.Foodname)
        .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        isFavorite = true;
      });
    } else {
      setState(() {
        isFavorite = false;
      });
    }
  }

  Future<void> removefav() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('MyFavourites')
        .where('Foodname', isEqualTo: widget.Foodname)
        .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }
      setState(() {
        isFavorite = false;
      });
    }
  }

  Future<void> addtoFav() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('MyFavourites')
        .where('Foodname', isEqualTo: widget.Foodname)
        .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    if (querySnapshot.docs.isEmpty) {
      await FirebaseFirestore.instance.collection('MyFavourites').add({
        'image': widget.image,
        'Foodname': widget.Foodname,
        'Incredients': widget.Incredients,
        'Recepie': widget.Recepie,
        'userID': FirebaseAuth.instance.currentUser!.email,
      });
      setState(() {
        isFavorite = true;
      });
    } else {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2, // Number of tabs
          child: SingleChildScrollView(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Recipie').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.4,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenSize.width * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.Foodname,
                              style: TextStyle(fontSize: screenSize.width * 0.06, color: Colors.red),
                            ),
                            IconButton(
                              onPressed: () {
                                if (isFavorite) {
                                  removefav();
                                } else {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                    addtoFav();
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => fav()));
                                  });
                                }
                              },
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                                color: Colors.red[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Tab bar for Ingredients and Instructions
                      TabBar(
                        tabs: [
                          Tab(text: 'Ingredients'),
                          Tab(text: 'Instructions'),
                        ],
                      ),
                      // Tab bar views for Ingredients and Instructions content
Container(                  height: screenSize.height * 0.9, // Adjust height as needed
                        child: TabBarView(
                          children: [
                            // Ingredients tab view
                            Padding(
                              padding: EdgeInsets.all(screenSize.width * 0.04),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ingredients',
                                      style: TextStyle(fontSize: screenSize.width * 0.05, color: Colors.red),
                                    ),
                                    SizedBox(height: screenSize.width * 0.02),
                                    Text(
                                      widget.Incredients,
                                      style: TextStyle(fontSize: screenSize.width * 0.04),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Instructions tab view
                            Padding(
                              padding: EdgeInsets.all(screenSize.width * 0.04),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Instructions',
                                      style: TextStyle(fontSize: screenSize.width * 0.05, color: Colors.red),
                                    ),
                                    SizedBox(height: screenSize.width * 0.04),
                                    Text(
                                      widget.Recepie,
                                      style: TextStyle(fontSize: screenSize.width * 0.04),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
