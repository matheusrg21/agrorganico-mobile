import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/models/Fruit.dart';
import 'package:agroorganico_frontend/widgets/profile_button.dart';
import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';

class FruitDetailScream extends StatelessWidget {
  static const String routeName = '/fruit-screen';
  final Fruit fruit;

  FruitDetailScream({@required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileButton(),
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 40),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                    onPressed: () => Navigator.of(context).pop()),
              )
            ],
          ),
          Text(
            fruit.name,
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Image(height: 340, width: 340, image: fruit.image),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffC8C8C8),
                    ),
                    child: Text(
                      fruit.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: null,
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text(
                    "Adicione a sua lista de compras",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: UserBottomNavbar(
        currentIndex: 0,
        context: context,
      ),
    );
  }
}
