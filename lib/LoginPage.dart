import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {

      form.save();

      print('Valid Form Email:$_email, password: $_password ');
    } else {
      print('Invalid Form Email: $_email, password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Login Page"),
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: "Email"),
                validator: (value) =>
                    value.isEmpty ? 'Email No fit be Empty' : null,
                     onSaved: (value) => _email = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) =>
                    value.isEmpty ? 'Password No fit be Empty' : null,
                    onSaved: (value) => _password = value,
              ),
              new ElevatedButton(
                child: new Text('Login',
                    style: new TextStyle(
                      fontSize: (20.0),
                    )),
                onPressed: validateAndSave,
              )
            ],
          )),
        ));
  }
}
