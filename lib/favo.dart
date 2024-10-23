import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/receippe.dart';

class fav extends StatelessWidget {
  const fav({Key? key});

  Future<void> deleteFav(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('MyFavourites').doc(documentId).delete();
    } catch (e) {
      print('Deleting fav items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favourites',
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('MyFavourites').where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('Your Favourites are empty'),
                  );
                }

                return GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenSize.width < 600 ? 2 : 3, // Adjust the number of columns based on screen width
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
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                height: screenSize.width * 0.40, // Adjust height based on screen width
                                width: screenSize.width * 0.45, // Adjust width based on screen width
                                child: Image.network(
                                  document['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 0.3),
                                    child: Center(
                                      child: Text(
                                        document['Foodname'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    deleteFav(document.id);
                                  },
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.red[800],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
