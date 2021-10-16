import 'package:flutter/material.dart';

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
            pageBuilder: (context, _, __) => null,
            transitionDuration: Duration(seconds: 0),
          ),
          (ModalRoute.withName('/')),
        );
        break;
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => null,
            transitionDuration: Duration(seconds: 0),
          ),
          (ModalRoute.withName('/')),
        );
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => null,
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
      selectedItemColor: Color(0xFFEF6C00),
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
