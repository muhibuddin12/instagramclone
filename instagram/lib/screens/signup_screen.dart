import 'package:flutter/material.dart';
import 'package:instagram/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit(){
    if(_formkey.currentState.validate()){
      _formkey.currentState.save();
      print(_name);
      print(_email);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Text(
              'Instagram',
              style: TextStyle(
                fontFamily: 'Billabong', 
                fontSize: 50.0,
              ),
            ),
            Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                    ),
                    child : TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (input) => input.trim().isEmpty ? 'Tolong masukkan nama yang valid':null,
                      onSaved: (input) => _name = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                    ),
                    child : TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (input) => !input.contains('@') ? 'Tolong masukkan email yang valid':null,
                      onSaved: (input) => _email = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (input) => input.length < 6 ? "Paling sedikit 6 karakter" : null,
                      onSaved: (input) => _password = input,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontFamily: 'Roboto Medium',
                                color: Colors.white,
                                fontSize: 18.0
                              ),
                            ),                    
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 250.0,
                    color: Colors.blue,
                    child: FlatButton(
                      onPressed: () => Navigator.pop(context, LoginScreen.id),
                      color: Colors.blue,
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Back to Login',
                        style: TextStyle(
                          fontFamily: 'Roboto Medium',
                          fontSize: 18.0,
                          color: Colors.white
                        ),
                      ),      
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}