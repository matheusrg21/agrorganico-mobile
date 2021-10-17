import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/screens/main_screen.dart';
import 'package:agroorganico_frontend/screens/shopping_list_screen.dart';
import 'package:agroorganico_frontend/screens/map_screen.dart';

class UserBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final BuildContext context;

  UserBottomNavbar({
    @required this.currentIndex,
    @required this.context,
  });

  void _onItemTapped(index) {
    if (index == currentIndex) {
      return;
    }

    switch (index) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => MainScreen(),
            transitionDuration: Duration(seconds: 0),
          ),
          (ModalRoute.withName('/')),
        );
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => ShoppingListScreen(),
            transitionDuration: Duration(seconds: 0),
          ),
          (ModalRoute.withName('/')),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => MapScreen(),
            transitionDuration: Duration(seconds: 0),
          ),
          (ModalRoute.withName('/')),
        );
        break;
      default:
        Navigator.of(context).pushReplacementNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff424141),
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Lista',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_pin),
          label: 'Map',
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
