import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/adminhome.dart';
import 'package:myapp/adminlogin.dart';
import 'package:myapp/forgotpswrd.dart';
import 'package:myapp/frontpage.dart';
import 'package:myapp/signup.dart';
import 'package:myapp/admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _passwordVisible = false;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future signin(BuildContext context) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
      }
    } catch (error) {
      print('Login failed: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please check your email and password.'),
        ),
      );
      showDialog(context: context, builder: (context) => AlertDialog(

        title: Text('alert'),
        content: Text(error.toString()),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('ok'))
        ],
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIGN IN',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Admin',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Adminlogin()),
                );
              },
              child: ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Admin'),
              ),
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://3.bp.blogspot.com/-nYA0bHCYhwU/U4K3jCjis0I/AAAAAAAAAEk/KcvLAZa_SJA/s1600/healthy-food-stocks.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: screenSize.height * 0.5,
                        width: screenSize.width * 0.9,
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
                              height: screenSize.height * 0.03,
                            ),
                            // CircleAvatar(
                            //   radius: screenSize.width * 0.15,
                            //   backgroundImage: NetworkImage(
                            //       'https://norrismgmt.com/wp-content/uploads/2020/05/24-248253_user-profile-default-image-png-clipart-png-download.png'),
                            // ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.1),
                              child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                  labelText: 'Email id ',

                                  labelStyle:
                                  TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenSize.width * 0.1),
                              child: TextField(
                                controller: password,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                  TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),

                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(8), // Adjust the border radius as needed
                                color: Colors.black
                                    .withOpacity(0.2), // Adjust opacity as needed
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    // Shadow color
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 2), // Shadow position
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  signin(context);
                                },
                                style: ButtonStyle(
                                  elevation:
                                  MaterialStateProperty.all<double>(0),
                                  // No elevation for the button itself
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                  // Transparent background
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  // Text color
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Forgotpaswrd()),
                                    );
                                  },
                                  child: Text(
                                    'Forgot Password ?',
                                    style:
                                    TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()),
                                    );
                                  },
                                  child: Text(
                                    'Create Account',
                                    style:
                                    TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
