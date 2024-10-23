import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/receippe.dart';

class NewRecipesPage extends StatefulWidget {
  const NewRecipesPage({super.key});

  @override
  State<NewRecipesPage> createState() => _NewRecipesPageState();
}

class _NewRecipesPageState extends State<NewRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Recipes',
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      body: Builder(
        builder: (context) {
          var screenSize = MediaQuery.of(context).size;
          return Column(
            children: [
              Expanded(
                // Use Expanded to allow SingleChildScrollView to take all available space
                child: SingleChildScrollView(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('NewRecipes')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          // Disable GridView's scrolling
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenSize.width > 600 ? 4 : 1,
                            // Adjust number of columns based on screen width
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final document = snapshot.data!.docs[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => details(
                                      image: document['image'],
                                      Foodname: document['Foodname'],
                                      Incredients: document['Incredients'],
                                      Recepie: document['Recepie'],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 9,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          height: 250,
                                          width: 300,
                                          child: Image.network(
                                            document['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        document['Foodname'],
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
