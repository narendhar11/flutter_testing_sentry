import 'package:flutter/material.dart';
import 'validation_mixin.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget{
  static String tag = 'Login Page';

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {

  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    Widget logoText(){
      return Text('Login', style: TextStyle(fontWeight: FontWeight.bold));
    }

    Widget emailField() {
      return TextFormField(
        key: Key('email'),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@example.com',
        ),
        validator:
        validateEmail, //passing the reference of the validation mixin, not calling directly
        onSaved: (String value) {
          email = value;
        },
      );
    }

    Widget passwordField() {
      return TextFormField(
        key: Key('password'),
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
        ),
        validator: validatePassword,
        onSaved: (String value) {
          password = value;
        },
      );
    }

    Widget submitButton() {
      return RaisedButton(
        color: Colors.blue,
        child: Text('Submit'),
        onPressed: () {
          //*: Need to get a reference of the Form Widget with Global key to perform form validation
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                logoText(),
                emailField(),
                passwordField(),
                Container(margin: EdgeInsets.only(top: 25.0)),
                submitButton(),
              ],
            ),
          ),
        ),
      )
    );
  }
}