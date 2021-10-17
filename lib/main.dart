import 'package:flutter/material.dart';
import './screens/sign_in_screen.dart';
import './screens/sign_up_screen.dart';
import './screens/main_screen.dart';
import './screens/shopping_list_screen.dart';
import './screens/map_screen.dart';
import './screens/fruit_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agrorganico',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: SignInScreen()),
      routes: <String, WidgetBuilder>{
        SignInScreen.routeName: (ctx) => SignInScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        MainScreen.routeName: (ctx) => MainScreen(),
        ShoppingListScreen.routeName: (ctx) => ShoppingListScreen(),
        MapScreen.routeName: (ctx) => MapScreen(),
        FruitDetailScream.routeName: (ctx) => FruitDetailScream(fruit: null)
      },
    );
  }
}
