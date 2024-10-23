// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class bell extends StatelessWidget {
//   const bell({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Notifications'),
//         ),
//         body: NotificationList(), // Widget to display notifications
//       ),
//     );
//   }
// }
//
// class NotificationList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('Recipie').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         // If there are no documents, show a message
//         if (snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('No notifications yet.'));
//         }
//
//         // Build the list of notifications
//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['Foodname'] ?? 'Unknown Food',),
//               subtitle: Text('New recipe added!'),
//               onTap: () {
//                 // Handle tapping on notification if needed
//               },
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
