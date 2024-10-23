import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:myapp/receippe.dart';
import 'incredients.dart';

List<dynamic> availableCategories = [];
List<dynamic> filteredCategories = [];

class Cart extends StatefulWidget {
  const Cart({Key? key});

  @override
  State<Cart> createState() => _CartState();
}

bool isFavorite = false;

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Recipie').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            availableCategories = snapshot.data!.docs;
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: screenSize.height * 0.06),
                  child: TextFormField(
                    onChanged: filterCategory,
                    style: TextStyle(fontSize: screenSize.width * 0.05, color: Colors.green), // Adjust font size based on screen width
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search_sharp),
                        color: Colors.green,
                      ),
                      labelText: 'Search your food',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(screenSize.width * 0.1)), // Adjust border radius based on screen width
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: screenSize.height * 0.5,
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: filteredCategories.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: screenSize.width < 600 ? 2 : 3, // Adjust number of columns based on screen width
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => details(
                                    image: filteredCategories[index]['image'],
                                    Foodname: filteredCategories[index]['Foodname'],
                                    Incredients: filteredCategories[index]['Incredients'],
                                    Recepie: filteredCategories[index]['Recepie'],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(screenSize.width * 0.04), // Adjust padding based on screen width
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(screenSize.width * 0.1), // Adjust border radius based on screen width
                                    ),
                                    height: screenSize.height * 0.20, // Adjust height based on screen height
                                    width: screenSize.width * 0.5, // Adjust width based on screen width
                                    child: Image.network(
                                      filteredCategories[index]['image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Expanded(
                                      Padding(
                                        padding: EdgeInsets.only(right: screenSize.width * 0.02),
                                        child: Text(
                                          filteredCategories[index]['Foodname'],
                                          style: TextStyle(fontSize: screenSize.width * 0.04, fontWeight: FontWeight.bold), // Adjust font size based on screen width
                                        ),
                                      // ),
                                    ),
                                    // IconButton(
                                    //   onPressed: () {
                                    //     setState(() {
                                    //       isFavorite = !isFavorite;
                                    //     });
                                    //   },
                                    //   icon: Icon(
                                    //     isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                    //     color: isFavorite ? Colors.red[800] : null,
                                    //   ),
                                    // ),
                                  // ],
                                // ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => incredients()),
          );
        },
        child: Icon(Icons.edit),
        backgroundColor: Colors.green,
      ),
    );
  }

  void filterCategory(String query) {
    setState(() {
      filteredCategories = availableCategories.where((doc) {
        String category = doc.data()['Foodname'];
        return category.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }
}
