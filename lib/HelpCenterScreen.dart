import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatelessWidget {
  final String phoneNumber = '918089431452'; // Replace with your admin's WhatsApp number

  void _launchWhatsApp() async {
    String url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome to Hello cheff! - Your Ultimate Recipe Companion!\n\n'
                    'Discover, organize, and enjoy a world of culinary delights with Hello Cheff!. '
                    'Whether you\'re a novice cook or a seasoned chef, our app is designed to make your '
                    'cooking experience effortless and enjoyable.\n\n'
                    'Key Features:\n\n'
                    '• Search with Ease: Quickly find recipes by dish name or ingredients. Use our intuitive '
                    'search feature to discover recipes that match your cravings or what\'s in your pantry.\n\n'
                    '• Organize Favorites: Create your personalized favorite page to save and access your go-to '
                    'recipes with a single tap. Never lose track of your favorite dishes again!\n\n'
                    '• Meal Categories: Browse recipes conveniently categorized into Breakfast, Lunch, Dinner, '
                    'and Beverages. Whether you\'re planning a hearty breakfast or a refreshing drink, we\'ve got you covered.\n\n'
                    'How to Use:\n\n'
                    '• Search Recipes: Use the search bar to find recipes based on dish names or ingredients. '
                    'Narrow down your options effortlessly.\n\n'
                    '• Save Favorites: Tap the heart icon on any recipe to add it to your favorites. Access them '
                    'later for quick reference.\n\n'
                    '• Browse Categories: Explore our curated categories to discover new recipes for every '
                    'mealtime and occasion.\n\n'
                    'Get Started:\n\n'
                    'Download Hello Cheff! now and embark on a culinary adventure! Whether you\'re cooking for yourself '
                    'or entertaining guests, our app is your perfect kitchen companion.\n\n'
                    'Have questions or feedback? Reach out to our support team at 8089431452. Happy cooking!\n\n',

                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
