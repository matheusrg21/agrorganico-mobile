import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/models/Fruit.dart';
import 'package:agroorganico_frontend/widgets/profile_button.dart';

class FruitDetail extends StatelessWidget {
  final Fruit fruit;

  FruitDetail({@required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              ProfileButton(),
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop())
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
          Image(image: fruit.image),
          Text(
            fruit.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          TextButton(onPressed: null, child: Row())
        ],
      ),
    );
  }
}
