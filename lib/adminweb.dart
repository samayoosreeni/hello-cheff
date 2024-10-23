import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/adminlearn.dart';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class webs extends StatefulWidget {
  const webs({super.key});

  @override
  State<webs> createState() => _websState();
}
void delete(dele){
  FirebaseFirestore.instance.collection('Healthtip').doc(dele).delete();
}

class _websState extends State<webs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>learn()));
      },
        child: Icon(Icons.add,color: Colors.red,),),
      appBar: AppBar(
        title: Text('Add Tips',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),
      ),),
      body: StreamBuilder(stream:  FirebaseFirestore.instance.collection('Healthtip').snapshots(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return ListView.builder(itemCount: snapshot.data!.docs.length,
    itemBuilder: (BuildContext context,int index){
    final DocumentSnapshot document=snapshot.data!.docs[index];
    return Padding(padding: EdgeInsets.all(8.0),
    child: Container(
    width: 100,
    child: ListTile(
      leading: Image.network(
      document['Image'],
      fit: BoxFit.cover,),
      title: Text(document['Heading'],),
      trailing:  Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'adminweb',
              arguments: {
                'Image':document['Image'],
                'Heading':document['Heading'],
                'Tip':document['Tip'],
                'id':document.id,
              });
            }, icon: Icon(Icons.edit,color: Colors.red,)),
            IconButton(onPressed: (){
              delete(document.id);
            }, icon: Icon(Icons.delete,color: Colors.red,)),
          ],
        ),
      ),

    )));
    });
    };
    return CircularProgressIndicator();
}
    ),
    );
  }
}
class webupdate extends StatefulWidget {
  const webupdate({super.key});

  @override
  State<webupdate> createState() => _webupdateState();
}
TextEditingController head = TextEditingController();
TextEditingController tip = TextEditingController();
String image = '';

void updatetip(docId) {
  FirebaseFirestore.instance.collection('Healthtip').doc(docId).update({
    'Image': image,
    'Heading': head.text,
    'Tip': tip.text,
  });
}

class _webupdateState extends State<webupdate> {


  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map;
    image=args['Image'];
    head.text=args['Heading'];
    tip.text=args['Tip'];
    var docId=args['id'];

    return  SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: StreamBuilder(
                  stream:
                  FirebaseFirestore.instance.collection('Healthtip').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 600,
                              height: 656,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Column(children: [
                                GestureDetector(
                                  onTap: () async {
                                    final pickedFile = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (pickedFile == null) {
                                      return;
                                    } else {
                                      File file = File(pickedFile.path);
                                      image = await _uploadImage(file);
                                      setState(() {});
                                    }
                                  },
                                  child: SizedBox(
                                      height: 100,
                                      width: 200,
                                      // ignore: unnecessary_null_comparison
                                      child: image == null
                                          ? Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 3.0,
                                          ),
                                        ),
                                        child: const Center(
                                            child: Text(
                                              'Pick Poster',
                                              style: TextStyle(
                                                  color: Colors.teal, fontSize: 18),
                                            )),
                                      )
                                          : Image.network(image)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 30.00,
                                    right: 30.00,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: head,
                                    decoration: InputDecoration(
                                      labelText: 'Heading',
                                      labelStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: tip,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: 'Tip url',
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(
                                      10.00,
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      updatetip(docId);

                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                Padding(padding: EdgeInsets.all(20.00)),
                              ]),
                            )
                          ]);
                    }
                    if (snapshot.hasError) {
                      log("Error caused while fetching data:${snapshot.error}");
                    }
                    return Text('Data loading');
                  }),
            )));
  }
}

Future<String> _uploadImage(File file) async {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  DateTime now = DateTime.now();
  String timestamp = now.microsecondsSinceEpoch.toString();
  firebase_storage.Reference ref = storage.ref().child('images/$timestamp');
  firebase_storage.UploadTask task = ref.putFile(file);
  await task;
  String downloadURL = await ref.getDownloadURL();
  log(downloadURL);
  image = downloadURL;
  return image;
}


