import 'package:flutter/material.dart';
import 'package:myapp/admin.dart';
import 'adminbreakfast.dart';
import 'adminlunch.dart';
import 'admindinner.dart';
import 'adminbevarage.dart';
import 'adminewrecipes.dart';
import 'admin nonveg.dart';
import 'admin vegan.dart';
import 'adminairfryer.dart';
import 'adminnocook.dart';
import 'admindesserts.dart';
import 'adminseafood.dart';
import 'adminkids.dart';
class food extends StatefulWidget {
  const food({super.key});

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  // Methods for existing categories
  void _onBreakfastPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminbreak()));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(' Loading Breakfast ')),
    );
  }

  void _onLunchPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminlunch()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Lunch ')),
    );
  }

  void _onDinnerPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => admindinner()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Dinner ')),
    );
  }

  void _onBeveragePressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminbevarage()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Beverage ')),
    );
  }

  // Methods for new categories
  void _onNewRecipesPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminewrecipes()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading New Recipes ')),
    );
  }

  void _onNonVegPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminnonveg()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Non-Veg ')),
    );
  }

  void _onVeganPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adimvegan()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Vegan')),
    );
  }

  void _onAirfryerPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminairfryer()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Airfryer ')),
    );
  }

  void _onNoCookPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminnocook()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading No-Cook ')),
    );
  }

  void _onDessertsPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => admindessert()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Desserts ')),
    );
  }

  void _onSeafoodPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminseafood()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Seafood ')),
    );
  }

  void _onKidsPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => adminkids()));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Loading Kids ')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
      },child: Icon(Icons.add,color: Colors.red,),
      ),
      appBar: AppBar(
        title: Text('Food Categories',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: 12, // Updated number of items
        itemBuilder: (BuildContext context, int index) {
          List<String> titles = [
            'Breakfast', 'Lunch', 'Dinner', 'Beverage',
            'New Recipes', 'Non-Veg', 'Vegan', 'Airfryer',
            'No-Cook', 'Desserts', 'Seafood', 'Kids'
          ];
          List<VoidCallback> actions = [
            _onBreakfastPressed,
            _onLunchPressed,
            _onDinnerPressed,
            _onBeveragePressed,
            _onNewRecipesPressed,
            _onNonVegPressed,
            _onVeganPressed,
            _onAirfryerPressed,
            _onNoCookPressed,
            _onDessertsPressed,
            _onSeafoodPressed,
            _onKidsPressed
          ];

          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: ListTile(
                title: TextButton(
                  onPressed: actions[index], // Assign the respective function
                  child: Text(titles[index],style: TextStyle(fontSize: 20,color: Colors.red),),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



// floatingActionButton: FloatingActionButton(onPressed: (){
//   Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
// },
// child: Icon(Icons.add,color: Colors.red,),),
//       appBar: AppBar(
//         title: Text('Add Item',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
//       ),
//       body: StreamBuilder(
//         stream:  FirebaseFirestore.instance.collection('Recipie')
//         .snapshots(),
//     builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return ListView.builder(itemCount: snapshot.data!.docs.length,
//           itemBuilder: (BuildContext context,int index){
//         final DocumentSnapshot document=snapshot.data!.docs[index];
//         return Padding(padding: EdgeInsets.all(8.0),
//         child: Container(
//             width: 100,
//           child: ListTile(
//             leading: Image.network(
//               document['image'],
//               fit: BoxFit.cover,
//             ),
//             title: Text( document['Foodname'],),
//             trailing: Container(
//               width: 100,
//               child: Row(
//                 children: [
//                   IconButton(onPressed: (){
//                     Navigator.pushNamed(context, 'foodupdate',
//                     arguments: {
//                       "image": document['image'],
//                       "Foodname": document['Foodname'],
//                       "Incredients": document['Incredients'],
//                       "Recepie": document['Recepie'],
//                       "id":document.id,
//                     });
//                   }, icon: Icon(Icons.edit,color: Colors.red,)),
//                   IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
//                 ],
//               ),
//             ),
//           ),
//         ),);
//           });
//
//     }
//     return CircularProgressIndicator();
//     },
//),