import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'breakfast.dart';
import 'lunch.dart';
import 'dinner.dart';
import 'bevarage.dart';
import 'Settings.dart';
import 'kids.dart';
import 'vegan.dart';
import 'seafood.dart';
import 'dessert.dart';
import 'nocook.dart';
import 'airfry.dart';
import 'trending.dart';
import 'newres.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<void> logout() async {

    await FirebaseAuth.instance.signOut();


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);


    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => login()),
          (route) => false,
    );
  }



  Widget _buildCategoryCard(BuildContext context, String title, String imageUrl) {
    return GestureDetector(
      onTap: () {
        switch (title) {
          case 'NewRecipes':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewRecipesPage()),
            );
            break;
          case 'NonVeg':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrendingNowPage()),
            );
            break;
          case 'Airfryer':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AirfryerPage()),
            );
            break;
          case 'No-Cook':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NoCookPage()),
            );
            break;
          case 'Desserts':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DessertsPage()),
            );
            break;
          case 'Seafood':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeafoodPage()),
            );
            break;
          case 'Vegan':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VeganPage()),
            );
            break;
          case 'Kids':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KidsPage()),
            );
            break;
          default:
          // Handle default case or do nothing
            break;
        }
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(imageUrl),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Hello Chef!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.orange[900],
                          ),
                        ),
                      ),


                      PopupMenuButton<int>(
                        icon: Icon(Icons.more_vert, color: Colors.black),
                        itemBuilder: (context) => [
                          PopupMenuItem<int>(
                            value: 1,
                            child: ListTile(
                              leading: Icon(Icons.logout, color: Colors.blue),
                              title: Text('Logout'),
                              onTap: () {
                                logout();

                              },
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 2,
                            child: ListTile(
                              leading: Icon(Icons.settings, color: Colors.blue),
                              title: Text('Settings'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                                );
                              },
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 1) {
                            logout();
                          } else if (value == 2) {
                            // Handle settings action if needed
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => breakfast()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: screenSize.width * 0.1,
                                  backgroundImage: NetworkImage(
                                    'https://assets.gqindia.com/photos/5edf9878cc407f7a3078a5b2/master/w_1600%2Cc_limit/06.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Breakfast',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => lunch()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: screenSize.width * 0.1,
                                  backgroundImage: NetworkImage(
                                    'https://tse4.mm.bing.net/th?id=OIP.dkZoPJFoz2Z5Z7JuwSJmVQHaHZ&pid=Api&P=0&h=180',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Lunch',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => dinner()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: screenSize.width * 0.1,
                                  backgroundImage: NetworkImage(
                                    'https://cdn.loveandlemons.com/wp-content/uploads/2019/09/dinner-ideas-2.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Dinner',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => bevarage()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: screenSize.width * 0.1,
                                  backgroundImage: NetworkImage(
                                    'https://www.inquirer.com/resizer/Pk-zn0A9T63EoZDqBRw7XqnwJCU=/1400x932/smart/cloudfront-us-east-1.images.arcpublishing.com/pmn/MKPTZKGCRJFJTNT7ELVOPI4JJY.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Beverages',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildCategoryCard(
                        context,
                        'NewRecipes',
                        'https://images.pexels.com/photos/4936945/pexels-photo-4936945.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      ),
                      _buildCategoryCard(
                        context,
                        'NonVeg',
                        'https://images.pexels.com/photos/5410408/pexels-photo-5410408.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      ),
                      _buildCategoryCard(
                        context,
                        'Vegan',
                        'https://tse1.mm.bing.net/th?id=OIP.PpkXJ3fsf1o14c40ME1RSAHaE8&pid=Api&P=0&h=180',
                      ),
                      _buildCategoryCard(
                        context,
                        'Airfryer',
                        'https://www.tasteofhome.com/wp-content/uploads/2019/11/Mozzarella-sticks-GettyImages-185328724.jpg',
                      ),
                      _buildCategoryCard(
                        context,
                        'No-Cook',
                        'https://www.thebudgetdiet.com/wp-content/uploads/2017/06/1-11-500x400.jpg',
                      ),
                      _buildCategoryCard(
                        context,
                        'Desserts',
                        'https://img.sndimg.com/food/image/upload/q_92,fl_progressive/v1/img/recipes/46/36/26/N3kcaN5ERe6YQ3s9WBrF_165%2520gluten%2520free%2520cocoa%2520brownies.jpg',
                      ),
                      _buildCategoryCard(
                        context,
                        'Seafood',
                        'https://www.solitarytraveller.com/wp-content/uploads/2020/10/seafood_indian.jpg',
                      ),

                      _buildCategoryCard(
                        context,
                        'Kids',
                        'https://www.kidspartyworks.com/images/kids-party-food-12.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// SizedBox(
                //   height: 450,
                //   width: 480,
                //   child: StreamBuilder(
                //     stream: FirebaseFirestore.instance.collection('Recipie')
                //         .snapshots(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return GridView.builder(
                //           scrollDirection: Axis.vertical,
                //           itemCount: snapshot.data!.docs.length,
                //           shrinkWrap: true,
                //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //             childAspectRatio: 0.8,
                //             crossAxisCount: MediaQuery
                //                 .of(context)
                //                 .size
                //                 .width < 600 ? 2 : 3,
                //           ),
                //           itemBuilder: (BuildContext context, int index) {
                //             final document = snapshot.data!.docs[index];
                //
                //             return GestureDetector(
                //               onTap: () {
                //                 Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                     builder: (context) =>
                //                         details(
                //                           image: document['image'],
                //                           Foodname: document['Foodname'],
                //                           Incredients: document['Incredients'],
                //                           Recepie: document['Recepie'],
                //
                //                         ),
                //                   ),
                //                 );
                //               },
                //               child: Card(
                //                 shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(15.0),
                //                 ),
                //                 elevation: 9,
                //                 child: Column(
                //                   children: [
                //                     Padding(
                //                       padding: const EdgeInsets.all(9.0),
                //                       child: Container(
                //                         decoration: BoxDecoration(
                //                           borderRadius: BorderRadius.circular(
                //                               10.0),
                //                         ),
                //                         height: 150,
                //                         width: 150,
                //                         child: Image.network(
                //                           document['image'],
                //                           fit: BoxFit.cover,
                //                         ),
                //                       ),
                //                     ),
                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment
                //                           .center,
                //                       children: [
                //                         Padding(
                //                           padding: const EdgeInsets.only(
                //                               right: 0.3),
                //                           child: Text(
                //                             document['Foodname'],
                //                             style: TextStyle(
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //             );
                //           },
                //         );
                //       }
                //       if (snapshot.hasError) {
                //         return Center(
                //           child: Text('Error: ${snapshot.error}'),
                //         );
                //       }
                //       return Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     },
                //   ),
                // )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
