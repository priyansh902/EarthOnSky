import 'package:flutter/material.dart';

/// CategoryCard is a reusable widget that displays a category with an icon and a name. It is designed to be used in a horizontal list of categories on the home screen of the app. Each card consists of a circular icon with a background color and the category name below it. The card has a fixed width and can be easily customized by passing different icons, colors, and names. This widget can be used to represent various categories such as "Cardiology", "Dermatology", "Pediatrics", etc., allowing users to quickly identify and select their desired category when browsing through the app.
/// Example usage:
/// CategoryCard(
///  
/// name: 'Cardiology',
/// icon: Icons.favorite,
/// color: Colors.red,
/// ),

class CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;  

/// Constructor for the CategoryCard widget, which takes in the category name, icon, and color as parameters. The name is displayed below the icon, while the icon is shown within a circular background that uses the provided color with some opacity. This design allows for a visually appealing representation of different categories in the app, making it easier for users to navigate and find the services they are looking for. The widget can be used in a horizontal list to showcase multiple categories on the home screen or in any other part of the app where category selection is needed.
  const CategoryCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  
  /// The build method constructs the UI for the CategoryCard widget. It creates a container with a fixed width and margin, containing a column that holds the icon and the category name. The icon is wrapped in a circular container with a background color that is a lighter version of the provided color. Below the icon, the category name is displayed with a specific text style. This layout ensures that the card is visually appealing and easy to read, making it an effective way to represent different categories in the app.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 6),
          Text(
            name,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}