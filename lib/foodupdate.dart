// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';
//
//
//
// class foodupdate extends StatefulWidget {
//   const foodupdate({super.key});
//
//   @override
//   State<foodupdate> createState() => _foodupdateState();
// }
//
// TextEditingController Fname = TextEditingController();
// TextEditingController Fincre = TextEditingController();
// TextEditingController Frece = TextEditingController();
//
// String image = '';
// String SelectedCategory='None';
//  late String docId;
//
// void Updatefood({required String Category}) {
//   FirebaseFirestore.instance.collection('Recipie').doc(docId).update({
//     'image': image,
//     'Foodname': Fname.text,
//     'Incredients': Fincre.text,
//     'Recepie': Frece.text,
//
//   }).then((categoryref) {
//     if (Category == 'Breakfast') {
//       FirebaseFirestore.instance.collection('Breakfast').doc(docId).update({
//         'image': image,
//         'Foodname': Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//
//
//     if(Category =='Lunch'){
//       FirebaseFirestore.instance.collection('Lunch').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Dinner'){
//       FirebaseFirestore.instance.collection('Dinner').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Bevarage'){
//       FirebaseFirestore.instance.collection('Bevarage').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='NewRecipes'){
//       FirebaseFirestore.instance.collection('NewRecipes').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='NonVeg'){
//       FirebaseFirestore.instance.collection('NonVeg').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Airfryer'){
//       FirebaseFirestore.instance.collection('Airfryer').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='NoCook'){
//       FirebaseFirestore.instance.collection('NoCook').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Desserts'){
//       FirebaseFirestore.instance.collection('Desserts').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Seafood'){
//       FirebaseFirestore.instance.collection('Seafood').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Vegan'){
//       FirebaseFirestore.instance.collection('Vegan').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//     if(Category =='Kids'){
//       FirebaseFirestore.instance.collection('Kids').doc(docId).update({
//         'image': image,
//         'Foodname':Fname.text,
//         'Incredients': Fincre.text,
//         'Recepie': Frece.text,
//       });
//     }
//
//   });}
//
// // class _foodupdateState extends State<foodupdate> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final args=ModalRoute.of(context)!.settings.arguments as Map;
// //      image=args['image'];
// //    Fname.text=args['Foodname'];
// //     Fincre.text=args['Incredients'];
// //     Frece.text=args['Recepie'];
// //     SelectedCategory=args['Category']?? 'None';
// //        docId=args['id'];
// //
// //
// //     return SafeArea(
// //       child: Scaffold(
// //         body: SingleChildScrollView(
// //           child: StreamBuilder(
// //               stream: FirebaseFirestore.instance.collection('Recipie')
// //                   .snapshots(),
// //               builder: (context, snapshot) {
// //                 if (snapshot.hasData) {
// //                   return Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Container(alignment: Alignment.center,
// //                           width: 600,
// //                           height: 656,
// //                           decoration: BoxDecoration(
// //                               border: Border.all(color: Colors.black)
// //                           ),
// //                           child: Column(
// //                             children: [
// //                               GestureDetector(
// //                                 onTap: ()
// //                                 async {
// //                                   final pickedFile = await ImagePicker()
// //                                       .pickImage(source: ImageSource.gallery);
// //                                   if (pickedFile == null) {
// //                                     return;
// //                                   } else {
// //                                     File file = File(pickedFile.path);
// //                                     image = await _uploadImage(file);
// //                                     setState(() {});
// //                                   }
// //                                 },
// //                                 child: SizedBox(
// //                                     height:100,
// //                                     width: 200,
// //                                     // ignore: unnecessary_null_comparison
// //                                     child: image == null
// //                                         ? Container(
// //                                       height: 100,
// //                                       decoration: BoxDecoration(
// //                                         border: Border.all(
// //                                           color: Colors.black,
// //                                           width: 3.0,
// //                                         ),
// //
// //                                       ),
// //                                       child: const Center(
// //                                           child: Text(
// //                                             'Pick Poster',
// //                                             style: TextStyle(
// //                                                 color: Colors.teal,
// //                                                 fontSize: 18),
// //                                           )),
// //                                     )
// //                                         : Image.network(image)),
// //                               ),
// //                               Padding( padding: const EdgeInsets.only(left: 30.00,right: 30.00,),),
// //
// //                               Padding(
// //                                 padding: const EdgeInsets.all(8.0),
// //                                 child: TextField(
// //                                   controller: Fname,
// //                                   decoration: InputDecoration(
// //
// //                                     labelText: 'Food Name',labelStyle: TextStyle(color: Colors.black),
// //                                   ),),
// //                               ),
// //                               TextField(
// //                                 controller: Fincre,
// //                                 maxLines:2,
// //                                 decoration: InputDecoration(
// //                                   labelText: 'Incredients',labelStyle: TextStyle(color: Colors.black),
// //                                 ),),
// //                               TextField(
// //                                 controller: Frece,
// //                                 maxLines: 2,
// //                                 decoration: InputDecoration(
// //                                   labelText: 'Receipe',labelStyle: TextStyle(color: Colors.
// //                                 black),
// //                                 ),),
// //
// //
// //
// //                               DropdownButton<String>(value:SelectedCategory,
// //
// //                                   items: <String>['None','Breakfast','Lunch','Dinner','Bevarage','NewRecipes','NonVeg','Vegan','Airfryer','NoCook','Desserts','Seafood','Kids']
// //                                       .map((String value){
// //                                     return DropdownMenuItem<String>(value:value,
// //                                       child: Text(value),);
// //                                   },).toList(), onChanged: (String? newValue){
// //                                     setState(() {
// //                                       SelectedCategory=newValue!;
// //                                     });
// //                                   }),
// //
// //                               Padding(padding: EdgeInsets.all(10.00,)),
// //                               ElevatedButton(
// //                                   onPressed: (){
// //                                     setState(() {
// //                                       Updatefood(Category:SelectedCategory);
// //                                        // docId;
// //
// //                                       Navigator.pop(context);
// //                                     });
// //
// //
// //
// //                                   }, child: Text('Update',style: TextStyle(color: Colors.red),)),
// //                               Padding(padding: EdgeInsets.all(20.00)),
// //
// //
// //                             ],
// //                           ),
// //                         ),
// //                       ]
// //                   );
// //                 }
// //                 if (snapshot.hasError){
// //                   log("Error caused while fetching data:${snapshot.error}");
// //
// //                 }
// //                 return Text('Data loading');
// //
// //               }),
// //
// //         ),
// //
// //
// //       ),
// //
// //
// //     );
// //   }
// // }
// //
// // Future<String> _uploadImage(File file) async {
// //   final firebase_storage.FirebaseStorage storage =
// //       firebase_storage.FirebaseStorage.instance;
// //
// //   DateTime now = DateTime.now();
// //   String timestamp = now.microsecondsSinceEpoch.toString();
// //   firebase_storage.Reference ref = storage.ref().child('images/$timestamp');
// //   firebase_storage.UploadTask task = ref.putFile(file);
// //   await task;
// //   String downloadURL = await ref.getDownloadURL();
// //   log(downloadURL);
// //   image = downloadURL;
// //   return image;
// // }