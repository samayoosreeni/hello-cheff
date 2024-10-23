import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/receippe.dart';

class lunch extends StatefulWidget {
  const lunch({Key? key}) : super(key: key);

  @override
  State<lunch> createState() => _lunchState();
}

class _lunchState extends State<lunch> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lunch',
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: screenSize.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Lunch').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
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
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        height: screenSize.width * 0.70,
                                        width: screenSize.width * 0.70,
                                        child: Image.network(
                                          document['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      document['Foodname'],
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
