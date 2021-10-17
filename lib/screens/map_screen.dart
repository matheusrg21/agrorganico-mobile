import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Map',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottomNavigationBar: UserBottomNavbar(currentIndex: 2, context: context),
    );
  }
}
