import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/admindinner.dart';
import 'package:myapp/adminewrecipes.dart';
import 'adminlunch.dart';
import 'package:myapp/frontpage.dart';
import 'adminbreakfast.dart';
import 'adminbevarage.dart';
import 'admin nonveg.dart';
import 'admin vegan.dart';
import 'adminairfryer.dart';
import 'adminnocook.dart';
import 'admindesserts.dart';
import 'adminseafood.dart';
import 'adminkids.dart';
import 'adminweb.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splashscreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: 'AIzaSyBvW46t2NXSg0gf8SgxJccu1p5BfBK1kJQ',
        appId: "1:155893633980:android:180e6a65dd43af712911b9",
        messagingSenderId: '155893633980',
        projectId: "hello-chef-16c70",
    storageBucket: 'gs://hello-chef-16c70.appspot.com',)
  );
runApp(SafeArea(child: MaterialApp(home: splash(), routes:{
  'adminbreakfast':(context)=> breakupdate(),
  'admindinner':(context)=> dinnerupdate(),
  'adminlunch' :(context)=> lunchupdate(),
  'adminbevarage':(context)=> bevarageupdate(),
  'adminewrecipes': (context)=> newrecipesupdate(),
  'admin nonveg':(context)=> Nonvegupdate(),
  'admin vegan' : (context)=> veganupdate(),
  'adminairfryer':(context)=> airfryerupdate(),
  'adminnocook':(context)=> nocookupdate(),
  'admindesserts':(context)=> dessertsupdate(),
  'adminseafood':(context)=> seafoodupdate(),
  'admindkids':(context)=> kidsupdate(),
  'adminweb':(context)=>webupdate(),
},
  debugShowCheckedModeBanner: false,)));
}



class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool finalEmail=false;

  Future getUserData() async {
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtainedEmail= sharedPreferences.getBool('isLogged');
    setState(() {
      finalEmail=obtainedEmail!;
    });
  }
  @override
  void initState() {
   getUserData().whenComplete((){
     if(finalEmail==false){
       Navigator.push(context , MaterialPageRoute(builder: (context)=>splashScreen()));
     }else{
       Navigator.push(context , MaterialPageRoute(builder: (context)=>Home()));
     }
   });
   super.initState();
  }
  Widget build(BuildContext context) {
    return Center(
      child: Image.network('https://cdn2.iconfinder.com/data/icons/food-restaurant-1/128/flat-13-1024.png'),

    );

  }
}
