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
          
          spacing: 25,
          children: [
            Text(
              "My notes",
              
              style: TextStyle(
               
                color: Colors.grey[720],
                fontSize: 40,
                letterSpacing: 1.2,
                
                fontWeight: FontWeight.bold,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/noteImg.jpeg",
                fit: BoxFit.contain,
                color: Colors.yellow,
                colorBlendMode: BlendMode.softLight,
                
            ),
            ),
            Text(
              "Bienvenue sur l'appli my notes. Renseigner le formulaire suivant pour accéder à l'application. Un compte automatique sera créer dès que vous le remplisser une première fois. Vous n'avez droit qu'a 5 compte sur l'appli. Amusez vous bien!",
              maxLines: null,
              style: TextStyle(
                color: Colors.grey[450],
                fontSize: 14,
                wordSpacing: 0.4
              ),
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
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                border: UnderlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                fixedSize: Size(320, 40),
                elevation: 0,
              ),
              child: Text(
                "S'enregistrer",
                style: TextStyle(fontSize: 15, color: Colors.grey[140])
              ),
            ),
          ],
        ),
      ),
    );
  }
}