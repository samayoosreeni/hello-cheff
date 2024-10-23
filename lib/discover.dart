import 'package:flutter/material.dart';
import 'package:myapp/receippe.dart';

class Discover extends StatefulWidget {
  final List filteredCategories;

  const Discover({Key? key, required this.filteredCategories}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Items',
          style: TextStyle(fontSize: screenSize.width * 0.06, color: Colors.green), // Adjust font size based on screen width
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: screenSize.height * 0.8, // Adjust height based on screen height
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.filteredCategories.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: screenSize.width < 600 ? 2 : 3, // Adjust number of columns based on screen width
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => details(
                            image: widget.filteredCategories[index]['image'],
                            Foodname: widget.filteredCategories[index]['Foodname'],
                            Incredients: widget.filteredCategories[index]['Incredients'],
                            Recepie: widget.filteredCategories[index]['Recepie'],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenSize.width * 0.04), // Adjust padding based on screen width
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(screenSize.width * 0.2), // Adjust border radius based on screen width
                            ),
                            height: screenSize.height * 0.20, // Adjust height based on screen height
                            width: screenSize.width * 0.4, // Adjust width based on screen width
                            child: Image.network(
                              widget.filteredCategories[index]['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Expanded(
                              Padding(
                                padding: EdgeInsets.only(right: screenSize.width * 0.02),
                                child: Center(
                                  child: Text(
                                    widget.filteredCategories[index]['Foodname'],
                                    style: TextStyle(fontSize: screenSize.width * 0.04, fontWeight: FontWeight.bold), // Adjust font size based on screen width
                                  ),
                                ),
                              ),
                            // ),
                            // IconButton(
                            //   onPressed: () {
                            //     setState(() {
                            //       isFavorite = !isFavorite;
                            //     });
                            //   },
                            //   icon: Icon(
                            //     isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            //     color: isFavorite ? Colors.red[800] : null,
                            //   ),
                            // ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
