import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/models/Fruit.dart';

class FruitItem extends StatelessWidget {
  final Fruit fruit;
  FruitItem({@required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image(
        //   image: fruit.image,
        // ),

        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Image(
            image: fruit.image,
            // width: MediaQuery.of(context).size.width,
            // height: 200,
            // width: 200,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xffC8C8C8),
          ),
          child: TextButton(
            onPressed: () => null,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  fruit.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
