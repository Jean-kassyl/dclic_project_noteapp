import 'package:flutter/material.dart';
import 'package:dclic_project_noteapp/models/note_models.dart';
import 'package:dclic_project_noteapp/pages/notes_page.dart';
import 'package:dclic_project_noteapp/models/user_models.dart';


class CreateNotePage extends StatefulWidget {
  final String username;
  const CreateNotePage({Key? key, required this.username}): super(key: key);

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "Mynotes",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey[180],
          ),
        ),
       
        
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: CreateDynamicPart(username: widget.username),
      ),
    );
  }
}


class CreateDynamicPart extends StatefulWidget {
  final String username;
  const CreateDynamicPart({Key? key, required this.username}): super(key: key);

  @override
  State<CreateDynamicPart> createState() => _CreateDynamicPartState();
}

class _CreateDynamicPartState extends State<CreateDynamicPart> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  NoteDatabaseManager myNoteDb = NoteDatabaseManager();
  UserDatabaseManager myUserDb = UserDatabaseManager();

  int? userId = 0;

  Future<void> _getId() async{
    final int? usrId = await myUserDb.getIdByName(widget.username);
    setState(() => userId = usrId);
  }


  Future<void> _setUserId() async {
    await _getId();
  }
 

  Future<void> _insertNote(Note note) async{
    await myNoteDb.insertNote(note);
  }

  void _showDialog( String content){
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
 void initState(){
  super.initState();
  _setUserId();
 }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      spacing: 20,
      children: [
        Text(
          'Créer une nouvelle Note',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        TextField(
          controller: _titreController,
          decoration: InputDecoration(
            labelText: 'Titre',
            border: OutlineInputBorder(),
          ),
        
        ),

        TextField(
          controller: _noteController,
          maxLines: 2,
          decoration: InputDecoration(
            labelText: 'Note',
            border: OutlineInputBorder(),
          ),
        
        ),

        ElevatedButton(
          onPressed: (){
            if(_titreController.text != '' || (_noteController.text != '')){
              Note newNote = Note(titre: _titreController.text, note: _noteController.text, userId: userId);
              _insertNote(newNote);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NotesPage(username: widget.username)
              ));
              

            }else {
              _showDialog("Remplissez le formulaire pour créer une note");
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            elevation: 0,
            minimumSize: Size(200.0, 50.0),
          ),
          child: Text(
            'Créer Note',
            style: TextStyle(
              fontSize: 20,
            ),
          ),

        ),
      ],
    )
    );
  }
}