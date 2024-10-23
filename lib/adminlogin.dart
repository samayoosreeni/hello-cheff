import 'package:flutter/material.dart';
import 'package:myapp/adminhome.dart';

const String adminEmail = 'admin@gmail.com';
const String adminpassword = 'admin@123';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20.0), // Spacer between fields
              TextFormField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  ),
                ),
                obscureText: !_isObscured,
              ),
              SizedBox(height: 20.0), // Spacer between fields
              ElevatedButton(
                onPressed: () {
                  String email = emailcontroller.text;
                  String password = passwordcontroller.text;
                  if (email == adminEmail && password == adminpassword) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => adminhome()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Wrong credentials'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
