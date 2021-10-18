import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';
import 'package:agroorganico_frontend/widgets/profile_button.dart';
import 'package:agroorganico_frontend/widgets/shopping_item.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShoppingListScreen extends StatefulWidget {
  static const String routeName = '/shopping-list';

  @override
  _ShoppingListScreenState createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<String> _shoppingList = [];
  String _newItem;
  final _key = new GlobalKey<FormState>();
  final dio = Dio();

  Future<String> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs?.getString('token');
  }

  Future<List<String>> _getShoppingList() async {
    print("SHOPPING LIST");
    final userToken = await _getToken();
    var fruits = await dio.get("https://agroorganicobackend.herokuapp.com/fruits/", options: Options(headers: {"Authorization": "Bearer $userToken", 'Content-Type': 'application/json',
    'Accept': 'application/json'}));
    List<String> allFruits = [];
    for (var fruit in fruits.data){
      allFruits.add(fruit['name']);
    }
    print(allFruits);

    setState(() {
      _shoppingList = allFruits;
    });
    return this._shoppingList;
  } //Função para pegar a lista do back-end

  Future<void> _removeFruitFromList() async {

  }
  void _removeItem(int index) {
    //Remover no back-end
    // _shoppingList.removeAt(index);
    setState(() {
      _shoppingList.removeAt(index);
    });
  }

  void _add() {
    if (!_key.currentState.validate()) {
      // Invalid!
      return;
    }
    // adicionar no back-end
    setState(() {
      _shoppingList.add(_newItem);
    });
  }

  @override
  void initState() {
    super.initState();
    _getShoppingList();
    _shoppingList = [];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Text(
            'Lista de compras',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Form(
              key: _key,
              child: TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Escreva seus produtos'),
                  onChanged: (value) => _newItem = value,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'O Campo não pode ser vazio';
                    }
                    return null;
                  }),
            ),
          ),
          IconButton(icon: Icon(Icons.add), onPressed: _add),
          Expanded(
            flex: 1,
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
                      itemCount: _shoppingList.length,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ShoppingItem(
                          item: _shoppingList[i],
                          index: i,
                          onPressed: _removeItem,
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: UserBottomNavbar(currentIndex: 1, context: context),
    );
  }
}
