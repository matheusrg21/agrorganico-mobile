import 'dart:io';

// import 'package:f2dsys/screens/attendance_screen.dart';
import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/screens/sign_up_screen.dart';
// import 'package:provider/provider.dart';
// import '../../providers/auth.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> _authData = {
    'username': '',
    'password': '',
  };
  final _passwordController = TextEditingController();
  bool _passwordHidden = true;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();

    // try {
    //   Auth authProvider = Provider.of<Auth>(context, listen: false);
    //   await authProvider.signIn(_authData['username'], _authData['password']);

    // } on HttpException catch (error) {
    //   String errorMessage = 'A autenticação falhou.';
    //   if (error.toString().contains('Unauthorized')) {
    //     errorMessage =
    //         'Autenticação não autorizada.\n\nVerifique se suas credenciais foram inseridas corretamente.';
    //   }
  }

  void toggleHidePassword() {
    setState(() {
      _passwordHidden = !_passwordHidden;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF424141),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: 'EMAIL',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'O usuário não pode ser vazio';
                  }
                  return null;
                },
                onSaved: (value) => _authData['username'] = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF424141),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE5E5E5),
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: 'SENHA',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    color: Color(0xFF666666),
                    onPressed: toggleHidePassword,
                  ),
                ),
                obscureText: _passwordHidden,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'A senha não pode ser vazia';
                  }
                  return null;
                },
                onSaved: (value) => _authData['password'] = value,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onPressed: _submit,
                    ),
                    TextButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(SignUpScreen.routeName)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
