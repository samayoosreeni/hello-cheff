import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController userName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();



Future Users() async {
  await FirebaseFirestore.instance.collection('Users').add({
    'User_Name':userName.text,'Email':email.text,'password':password.text
  });
}
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Future<void> createUser() async {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
      }
      catch(e){
        showDialog(context: context, builder: (context) => AlertDialog(

          title: Text('alert'),
          content: Text(e.toString()),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('ok'))
          ],
        ),);
      }
    }
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://3.bp.blogspot.com/-nYA0bHCYhwU/U4K3jCjis0I/AAAAAAAAAEk/KcvLAZa_SJA/s1600/healthy-food-stocks.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: screenSize.height * 0.7,
                      width: screenSize.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80.0,
                          ),
                          // CircleAvatar(
                          //   radius: screenSize.width * 0.2,
                          //   backgroundImage: NetworkImage(
                          //       'https://norrismgmt.com/wp-content/uploads/2020/05/24-248253_user-profile-default-image-png-clipart-png-download.png'),
                          //
                          // ),
                          Padding(padding: EdgeInsets.all(10.0)),
                          TextField(
                            controller: userName,
                            decoration: InputDecoration(
                              labelText: 'UserName',
                              labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),

                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email id',
                              labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),

                          ),
                          TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),

                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              createUser();
                              Users();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => login()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                // Set different colors based on the state of the button
                                if (states.contains(MaterialState.hovered)) {
                                  // Color when the button is hovered
                                  return Colors.black.withOpacity(0.5); // Adjust opacity as needed
                                } else {
                                  // Default color
                                  return Colors.white.withOpacity(0.1); // Adjust opacity as needed
                                }
                              }),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                              // You can add more properties here like padding, shape, etc.
                            ),
                            child: Text(
                              'Signup',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
