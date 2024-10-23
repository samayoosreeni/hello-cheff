import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class allusers extends StatelessWidget {
  const allusers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if (
          snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error:${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Users Found'));
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document){
              Map<String,dynamic>? data = document.data() as Map<String,dynamic>?;
              if(data == null) {
                return SizedBox();
              }
              String username =data['User_Name'] ?? 'No User_Name';
              String email = data['Email'] ?? 'No Email';
              return Card(
                child: ListTile(
                  title: Text(username),
                  subtitle: Text(email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){
                      showDeleteDialog(context,document.id);
                    },
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
void showDeleteDialog(BuildContext context,String userId) {
  showDialog(context: context, builder: (BuildContext dialogContext){
    return AlertDialog(
      title: Text('Confirm Delete'),
      content: Text('Are you sure you want to delete this user?'),
      actions: <Widget>[TextButton(onPressed: (){
        Navigator.of(dialogContext).pop();
      }, child: Text('Cancel')),
      TextButton(onPressed:(){
        deleteUser(userId);
        Navigator.of(dialogContext).pop();

      } , child: Text('Delete'),)],
    );
  });
}
void deleteUser(String userId) {
  FirebaseFirestore.instance.collection('Users').doc(userId).delete();
}
