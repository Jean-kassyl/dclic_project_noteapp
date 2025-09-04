import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My notes",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "My notes",
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            Image.asset(
                "assets/images/noteImg.jpeg"
            ),
            Text(
              "Welcome to this application",
              maxLines: null,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Utilisateur",
                border: UnderlineInputBorder(),
              ),
            ),

            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                border: UnderlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text(
                "Login"
              ),
            ),
          ],
        ),
      ),
    );
  }
}