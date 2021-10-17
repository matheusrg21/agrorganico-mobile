import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';
import 'package:agroorganico_frontend/widgets/profile_button.dart';

class ShoppingListScreen extends StatefulWidget {
  static const String routeName = '/shopping-list';

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<String> shoppingList = [];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileButton(),
          Text(
            'Frutas',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      bottomNavigationBar: UserBottomNavbar(currentIndex: 1, context: context),
    );
  }
}
