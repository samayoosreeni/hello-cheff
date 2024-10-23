import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpaswrd extends StatefulWidget {
  const Forgotpaswrd({super.key});

  @override
  State<Forgotpaswrd> createState() => _ForgotpaswrdState();
}

class _ForgotpaswrdState extends State<Forgotpaswrd> {
  final TextEditingController _emailController=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  bool issubmitting=false;
  void resetpassword() async {
    setState(() {

      issubmitting=true;
    });
    try{
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      _showResetDialog("Password Reset Email Sent","Check Your email to reset your password.");
    }catch (e){
      _showResetDialog('Error',e.toString());
    }finally{
      setState(() {
        issubmitting=false;
      });
    }
  }
  void _showResetDialog(String title,String content){
    showDialog(context: context, builder: (ctx)=>AlertDialog(
      title: Text(title),
      content: Text(content),
      actions:<Widget> [
        TextButton(onPressed: (){
          Navigator.of(ctx).pop();
    }, child: Text('OK'),

    )
      ],
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: screenSize.height * 0.4,
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
                        height: 20.0,
                      ),
                      // CircleAvatar(
                      //   radius: screenSize.width * 0.15,
                      //   backgroundImage: NetworkImage(
                      //       'https://i.pinimg.com/originals/6f/df/35/6fdf3511fd3fbdc1a5977e518207b930.jpg'),
                      // ),
                      Padding(padding: EdgeInsets.all(10.0)),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email id ',
                          labelStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),

                      ),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      ElevatedButton(
                        onPressed: issubmitting ? null : resetpassword,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.disabled)) {
                              // Transparent color when button is disabled
                              return Colors.transparent;
                            } else {
                              // Normal color when button is enabled
                              return Colors.black.withOpacity(0.5); // Adjust opacity as needed
                            }
                          }),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange), // Text color
                        ),
                        child: Text(
                          'Reset Password',
                          style: TextStyle(color: issubmitting ? Colors.grey : Colors.white,),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20.0)),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
