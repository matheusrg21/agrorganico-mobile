import 'package:flutter/material.dart';

class ShoppingItem extends StatelessWidget {
  final String item;
  final int index;
  final Function onPressed;
  ShoppingItem(
      {@required this.item, @required this.index, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffC8C8C8),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => onPressed(index)),
                  ]),
            ),
          ),
        )
      ],
    );
  }
}
