import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';


class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

TextEditingController Fname = TextEditingController();
TextEditingController Fincre = TextEditingController();
TextEditingController Frece = TextEditingController();

String image = '';
String SelectedCategory='None';

void _Addrecipie({required String Category}) {
  FirebaseFirestore.instance.collection('Recipie').add({
    'image': image,
    'Foodname': Fname.text,
    'Incredients': Fincre.text,
    'Recepie': Frece.text,
  }).then((categoryref) {
    if (Category == 'Breakfast') {
      FirebaseFirestore.instance.collection('Breakfast').add({
        'image': image,
        'Foodname': Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
if(Category =='Lunch'){
FirebaseFirestore.instance.collection('Lunch').add({
'image': image,
'Foodname':Fname.text,
'Incredients': Fincre.text,
'Recepie': Frece.text,
});
}
    if(Category =='Dinner'){
      FirebaseFirestore.instance.collection('Dinner').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
        });
    }
    if(Category =='Bevarage'){
      FirebaseFirestore.instance.collection('Bevarage').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
        });
    }
    if(Category =='NewRecipes'){
      FirebaseFirestore.instance.collection('NewRecipes').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='NonVeg'){
      FirebaseFirestore.instance.collection('NonVeg').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='Airfryer'){
      FirebaseFirestore.instance.collection('Airfryer').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='NoCook'){
      FirebaseFirestore.instance.collection('NoCook').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='Desserts'){
      FirebaseFirestore.instance.collection('Desserts').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='Seafood'){
      FirebaseFirestore.instance.collection('Seafood').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='Vegan'){
      FirebaseFirestore.instance.collection('Vegan').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }
    if(Category =='Kids'){
      FirebaseFirestore.instance.collection('Kids').add({
        'image': image,
        'Foodname':Fname.text,
        'Incredients': Fincre.text,
        'Recepie': Frece.text,
      });
    }

});}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Recipie')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(alignment: Alignment.center,
                          width: 600,
                          height: 656,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: ()
                                async {
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
                                    height:100,
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
                                                color: Colors.teal,
                                                fontSize: 18),
                                          )),
                                    )
                                        : Image.network(image)),
                              ),
                              Padding( padding: const EdgeInsets.only(left: 30.00,right: 30.00,),),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: Fname,
                                  decoration: InputDecoration(

                                    labelText: 'Food Name',labelStyle: TextStyle(color: Colors.black),
                                  ),),
                              ),
                              TextField(
                                controller: Fincre,
                                maxLines:2,
                                decoration: InputDecoration(
                                  labelText: 'Incredients',labelStyle: TextStyle(color: Colors.black),
                                ),),
                              TextField(
                                controller: Frece,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  labelText: 'Receipe',labelStyle: TextStyle(color: Colors.
                                black),
                                ),),



                              DropdownButton<String>(value:SelectedCategory,

                                  items: <String>['None','Breakfast','Lunch','Dinner','Bevarage','NewRecipes','NonVeg','Vegan','Airfryer','NoCook','Desserts','Seafood','Kids']
                                      .map((String value){
                                    return DropdownMenuItem<String>(value:value,
                child: Text(value),);
                },).toList(), onChanged: (String? newValue){
                                setState(() {
                                  SelectedCategory=newValue!;
                                });
                                  }),

                              Padding(padding: EdgeInsets.all(10.00,)),
                              ElevatedButton(
                                  onPressed: (){
                                    _Addrecipie(Category:SelectedCategory);

                                    Navigator.pop(context);
                                  }, child: Text('Submit',style: TextStyle(color: Colors.red),)),
                              Padding(padding: EdgeInsets.all(20.00)),


                            ],
                          ),
                        ),
                      ]
                  );
                }
                if (snapshot.hasError){
                  log("Error caused while fetching data:${snapshot.error}");

                }
                return Text('Data loading');

              }),

        ),
       
      ),


    );
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