import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';
import 'package:agroorganico_frontend/widgets/fruit_item.dart';
import 'package:agroorganico_frontend/models/Fruit.dart';
import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/widgets/profile_button.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diacritic/diacritic.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _fruits = [];

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs?.getString('token'));
    return prefs?.getString('token');
  }

  Future<void> _getFruits() async {
    // Função para pegar dados do back end
    print("GETTING FRUITS");
    var dio = Dio();
    final userToken = await _getToken();
    List<Fruit> allFruits = [];
    print("TOKEN: $userToken");
    var fruits = await dio.get("https://agroorganicobackend.herokuapp.com/fruits/", options: Options(headers: {"Authorization": "Bearer $userToken", 'Content-Type': 'application/json',
    'Accept': 'application/json'}));
    for (var responseFruit in fruits.data){
      var slugFilename = removeDiacritics(responseFruit['name']).toLowerCase().replaceAll("-", "_").replaceAll(" ", "").replaceAll(".", "");
      allFruits.add(new Fruit(
          id: responseFruit['id'],
          name: responseFruit['name'],
          description: responseFruit['description'],
          image: AssetImage('assets/images/fruits/$slugFilename.png')));
    }
    setState(() {
      _fruits = allFruits;
    });
  }

  @override
  void initState() {
    super.initState();
    _getFruits();
    _fruits = [];
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
