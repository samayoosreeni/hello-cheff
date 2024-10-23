import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:developer';

class admindessert extends StatefulWidget {
  const admindessert({super.key});

  @override
  State<admindessert> createState() => _admindessertState();
}

class _admindessertState extends State<admindessert> {
  Future<void> _deleteItem(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('Desserts').doc(docId).delete();
      // Optionally, delete from the 'Recipie' collection if needed
      await FirebaseFirestore.instance.collection('Recipie').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting item: $e')),
      );
    }
  }
  void _showDeleteConfirmationDialog(String docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Item'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            // Cancel button - just close the dialog
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            // OK button - delete the item
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _deleteItem(docId); // Call the function to delete the item
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('desserts',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
      ),
        body: StreamBuilder(
          stream:  FirebaseFirestore.instance.collection('Desserts')
              .snapshots(),
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
                            document['image'],
                            fit: BoxFit.cover,
                          ),
                          title: Text( document['Foodname'],),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(onPressed: (){ Navigator.pushNamed(context, 'admindesserts', arguments: {
                                  "image": document['image'],
                                  "Foodname": document['Foodname'],
                                  "Incredients": document['Incredients'],
                                  "Recepie": document['Recepie'],
                                  "id":document.id,

                                });},
                                    icon: Icon(Icons.edit,color: Colors.red,)),
                                IconButton(onPressed: (){
                                  // _deleteItem(document.id);
                                  _showDeleteConfirmationDialog(document.id);
                                }, icon: Icon(Icons.delete,color: Colors.red,)),
                              ],
                            ),
                          ),
                        ),
                      ),);
                  });

            }
            return CircularProgressIndicator();
          },
        )
    );
  }
}
class dessertsupdate extends StatefulWidget {
  const dessertsupdate({super.key});

  @override
  State<dessertsupdate> createState() => _dessertsupdateState();
}

class _dessertsupdateState extends State<dessertsupdate> {
  final TextEditingController Fname = TextEditingController();
  final TextEditingController Fincre = TextEditingController();
  final TextEditingController Frece = TextEditingController();

  String image = '';
  String selectedCategory = 'Desserts';
  late String docId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    image = args['image'];
    Fname.text = args['Foodname'];
    Fincre.text = args['Incredients'];
    Frece.text = args['Recepie'];
    selectedCategory = args['Category'] ?? 'Desserts';
    docId = args['id'];
  }

  Future<void> updatedessert({required String category}) async {
    try {
      final CollectionReference collection = FirebaseFirestore.instance.collection(category);
      await collection.doc(docId).update({
        'image': image,
        'Foodname': Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
      // Update the 'Recipie' collection as well if needed
      await FirebaseFirestore.instance.collection('Recipie').doc(docId).update({
        'image': image,
        'Foodname': Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    } catch (e) {
      log("Error updating document: $e");
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      final downloadURL = await _uploadImage(file);
      setState(() {
        image = downloadURL;
      });
    }
  }

  Future<String> _uploadImage(File file) async {
    final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
    DateTime now = DateTime.now();
    String timestamp = now.microsecondsSinceEpoch.toString();
    firebase_storage.Reference ref = storage.ref().child('images/$timestamp');
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Desserts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: image.isEmpty
                      ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Pick Poster',
                        style: TextStyle(color: Colors.teal, fontSize: 18),
                      ),
                    ),
                  )
                      : Image.network(image),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: Fname,
                decoration: InputDecoration(
                  labelText: 'Food Name',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextField(
                controller: Fincre,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Ingredients',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              TextField(
                controller: Frece,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Recipe',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              DropdownButton<String>(
                value: selectedCategory,
                items: <String>[
                  // 'None', 'Breakfast', 'Lunch', 'Dinner', 'Bevarage','NewRecipes', 'NonVeg','Vegan', 'Airfryer', 'NoCook',
                   'Desserts',
                  // 'Seafood', 'Kids'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await updatedessert(category: selectedCategory);
                  Navigator.pop(context);
                },
                child: Text('Update', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


