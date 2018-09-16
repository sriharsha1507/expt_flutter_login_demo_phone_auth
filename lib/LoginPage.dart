import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _mobileNumber;

  void validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print("Form is valid  $_mobileNumber");
    } else {
      print("Form is invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text('Flutter Phone Auth Demo')),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'Mobile number'),
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                validator: (number) {
                  if (number.isEmpty) {
                    return 'Mobile number cannot be empty';
                  } else if (number.length < 10) {
                    return 'Mobile number is invalid';
                  } else {
                    return null;
                  }
                },
                maxLength: 10,
                onSaved: (value) => _mobileNumber = value,
              ),
              new RaisedButton(
                child: new Text(
                  'Login',
                  style: new TextStyle(fontSize: 20.0),
                ),
                onPressed: validateAndSave,
              )
            ],
          ),
        ),
      ),
    );
  }
}
