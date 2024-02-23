import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget
{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  @override
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) 
  {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: ElevatedButton(
        onPressed: () async
        {
          print(email);
          print(password);
        },
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          side: BorderSide(width: 1),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context)
  {
    return Scaffold{
      backgroundColor: Colors.brown[100],
      
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Login"),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val)
                {
                  setState() => email = val;
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true;
                onChanged: (val)
                {
                  setState() => password = val;
                }
              ),
              SizedBox(height: 20.0),
              buildButton("Register", 1, Colors.pink[400]),
            ]
          ),
        ),
      ),
    };
  }
}