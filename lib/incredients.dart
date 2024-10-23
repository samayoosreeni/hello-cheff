import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/discover.dart';

class incredients extends StatefulWidget {
  const incredients({Key? key});

  @override
  State<incredients> createState() => _incredientsState();
}

class _incredientsState extends State<incredients> {
  List<dynamic> availableCategories = [];
  List<dynamic> filteredCategories = [];
  List<String> ingredientsList = [];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Recipie').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            availableCategories = snapshot.data!.docs;

            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(screenSize.width * 0.1), // Adjust padding based on screen width
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04, // Adjust font size based on screen width
                      color: Colors.green,
                    ),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _addIngredient();
                        },
                        icon: Icon(Icons.mode_edit),
                        color: Colors.green,
                      ),
                      labelText: 'Your Ingredients',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(screenSize.width * 0.05)), // Adjust border radius based on screen width
                        borderSide: BorderSide(
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ingredientsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          ingredientsList[index],
                          style: TextStyle(fontSize: screenSize.width * 0.04), // Adjust font size based on screen width
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removeIngredient(index);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.1), // Adjust top padding based on screen height
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(screenSize.width * 0.04), // Adjust padding based on screen width
                      child: ElevatedButton(
                        onPressed: () {
                          filterCategory();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Discover(
                                filteredCategories: filteredCategories,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Discover',
                          style: TextStyle(fontSize: screenSize.width * 0.05, color: Colors.white), // Adjust font size based on screen width
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.3, // Adjust horizontal padding based on screen width
                            vertical: screenSize.width * 0.06, // Adjust vertical padding based on screen width
                          ),
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _addIngredient() {
    setState(() {
      String ingredient = _controller.text.trim();
      if (ingredient.isNotEmpty && !ingredientsList.contains(ingredient)) {
        ingredientsList.add(ingredient);
      }
      _controller.clear();
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      ingredientsList.removeAt(index);
    });
  }

  void filterCategory() {
    filteredCategories.clear(); // Clear previous filtered categories
    for (String item in ingredientsList) {
      filter(item);
    }
  }

  void filter(String item) {
    setState(() {
      filteredCategories.addAll(availableCategories.where((doc) {
        String category = doc.data()['Incredients'];
        return category.contains(item);
      }).toList());
      filteredCategories = filteredCategories.toSet().toList(); // Remove duplicates
    });
  }
}
