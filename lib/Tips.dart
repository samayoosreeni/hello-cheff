

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/healthytips.dart';
import 'package:share_plus/share_plus.dart';

class tips extends StatefulWidget {
  const tips({super.key});

  @override
  State<tips> createState() => _tipsState();
}

class _tipsState extends State<tips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Healthy Tips',
    style: TextStyle(fontSize: 30, color: Colors.green),
  ),
),
      body:  Builder(
        builder: (context) {
      var screenSize = MediaQuery.of(context).size;
      return Column(
        children: [
          Expanded(
            // Use Expanded to allow SingleChildScrollView to take all available space
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Healthtip')
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
                                builder: (context) => healthtips(tipUrl : document['Tip']),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top:10,bottom: 28.0,left: 15,right: 15),
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
                                      height: 300,
                                      width: 450,
                                      child: Image.network(
                                        document['Image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    document['Heading'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                   color: Colors.deepOrange ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 1.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: (){
                                          Share.share(document['Tip']);
                                        }, icon:Icon( Icons.share),)
                                      ],
                                    ),
                                  )
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
