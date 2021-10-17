import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/logo_2.png',
                      // height: 200,
                      // width: 200,
                    ),
                  ),
                  // Text(
                  //   'Agroôrganico',
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SignUpForm(),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
