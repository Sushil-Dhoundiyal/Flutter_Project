import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
            // child: Text('hello'),
          ),
          Text('Welcome',
          style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
            height: 20.0,
            // child: Text('hello'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
              decoration: InputDecoration(
                hintText: "Enter username",
                labelText: "Username"
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
                labelText: "Password"
              ),
            ),
            SizedBox(
            height: 20.0,
            // child: Text('hello'),
          ),
          ElevatedButton(
            child: Text('Login'),
            style: TextButton.styleFrom(),
            onPressed: () {
              print('hi sushil')
            },
          )
              ],
            ),
          )
        ],
        )
    );
  }
}