import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';
import 'package:agroorganico_frontend/widgets/fruit_item.dart';
import 'package:agroorganico_frontend/models/Fruit.dart';
import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/widgets/profile_button.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _fruits = [];
  Fruit maca = new Fruit(
      id: '0',
      name: 'maça',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consequat vehicula risus vel accumsan. Ut sed fringilla libero. Integer semper libero quis sagittis pellentesque. Morbi feugiat velit metus, quis pretium metus ullamcorper at. Suspendisse sit amet fermentum ipsum. Aliquam auctor arcu nulla, eu porttitor massa cursus id. Maecenas sit amet consectetur lacus.',
      image: NetworkImage('https://picsum.photos/1000'));
  Fruit pera = new Fruit(
      id: '1',
      name: 'pera',
      description: 'uma fruta',
      image: NetworkImage('https://picsum.photos/1000'));
  Fruit morango = new Fruit(
      id: '1',
      name: 'morango',
      description: 'uma fruta',
      image: NetworkImage('https://picsum.photos/1000'));
  Fruit uva = new Fruit(
      id: '1',
      name: 'uva',
      description: 'uma fruta',
      image: NetworkImage('https://picsum.photos/1000'));
  Fruit kiwi = new Fruit(
      id: '1',
      name: 'kiwi',
      description: 'uma fruta',
      image: NetworkImage('https://picsum.photos/1000'));

  Future<void> _getFruits(BuildContext context) async {
    // await getFruits();
    setState(() {
      // _fruits = getFruitsresponde;
    });
  }

  @override
  void initState() {
    super.initState();
    _getFruits(context);
    _fruits = [maca, pera, morango, kiwi, uva];
  }

  @override
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
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _fruits.length,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: FruitItem(
                            fruit: _fruits[i],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: UserBottomNavbar(
        currentIndex: 0,
        context: context,
      ),
    );
  }
}
