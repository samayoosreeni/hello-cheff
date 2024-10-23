import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/receippe.dart'; // Assuming details page is correctly imported

class VeganPage extends StatefulWidget {
  const VeganPage({super.key});

  @override
  State<VeganPage> createState() => _VeganPageState();
}

class _VeganPageState extends State<VeganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vegan',
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      body: Builder(
        builder: (context) {
          var screenSize = MediaQuery.of(context).size;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('Vegan').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                        return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenSize.width > 600 ? 4 : 1,
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
                                          height: 250,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            image: DecorationImage(
                                              image: NetworkImage(document['image']),
                                              fit: BoxFit.cover,
                                            ),
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
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
