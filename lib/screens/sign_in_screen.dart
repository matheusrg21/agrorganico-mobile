import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'sign-in';

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
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                  // Container(
                  //   child: SvgPicture.asset(
                  //     'assets/images/logo_2.svg',
                  //     height: 20.0,
                  //     width: 20.0,
                  //     allowDrawingOutsideViewBox: false,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SignInForm(),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
