import 'package:flutter/material.dart';
import 'package:dclic_project_noteapp/pages/notes_page.dart';
import 'package:dclic_project_noteapp/models/user_models.dart';

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
  final UserDatabaseManager myUserDb = UserDatabaseManager();

  List<User> users = [];

  Future<void> _loadUsers() async{
    List<User> allUsers = await myUserDb.getAllUsers();
    setState(() => users = allUsers);
  }

  User? _findUserByName(String newUsername) {
    for (User user in users) {

      if(user.username == newUsername){
        return user;
      }
    }
    return null;
    
  }

  Future<void> _insertUser(User user) async{
    await myUserDb.insertUser(user);
  }

  bool checkUserInput(){
    if(_usernameController.text != ''  || _passwordController.text != ''){
      return true;
    }else {
      return false;
    }
  }

  void _showDialog(String content){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(content),
        actions: [
          TextButton(onPressed:(){ Navigator.of(context).pop();},child: Text("Retour"),)
        ]

      )
    );
  }
  
 @override
void  initState(){
  super.initState();
  _loadUsers();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( child: Container(
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
              "Bienvenue sur l'appli MyNotes. Renseigner le formulaire suivant pour accéder à l'application. Un compte automatique sera créer dès que vous le remplisser une première fois. Vous n'avez droit qu'a 5 compte sur l'appli. Amusez vous bien!",
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
              onPressed: () {
                
                if(!checkUserInput()){
                  
                  _showDialog("Remplissez le formulaire pour vous connecter!");
                }else {
                 User? registeredUser = _findUserByName(_usernameController.text);
                 if(registeredUser != null){
                  if(registeredUser.checkPassword(_passwordController.text)){
                    _showDialog("Bon retour sur MyNotes! ");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotesPage(),
                        settings: RouteSettings(arguments: registeredUser) 
                      )
                    );
                  }else{
                    _showDialog("Votre mot de passe ou nom d'utilisateur n'est pas correcte");
                  }
                 }else {
                  if(users.length == 5){
                    _showDialog("Vous devrez supprimer un compte avant de pourvoir en créer un autre");
                  } else {
                    User newUser = User(username: _usernameController.text, password: _passwordController.text);
                    _insertUser(newUser);
                    _showDialog("Votre nouveau compte a bien été créé");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotesPage(),
                        settings: RouteSettings(arguments: newUser)
                      )
                    );
                  }
                  


                 }
                }
              // end of button Onpressed
              },
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
    )
    );
  }
}