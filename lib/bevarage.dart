import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/receippe.dart';

class bevarage extends StatefulWidget {
  const bevarage({super.key});

  @override
  State<bevarage> createState() => _bevarageState();
}

class _bevarageState extends State<bevarage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Bevarage',
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 630,

              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Bevarage')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 0.8),
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
                                              Incredients:
                                              document['Incredients'],
                                              Recepie: document['Recepie'],
                                             )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),),
                                    elevation: 9,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10.0)),
                                            height: 250,
                                            width: 300,
                                            child: Image.network(
                                              document['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              document['Foodname'],
                                              style: TextStyle(fontSize:24,fontWeight: FontWeight.bold ),
                                            ),


                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error:${snapshot.error}'),
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
