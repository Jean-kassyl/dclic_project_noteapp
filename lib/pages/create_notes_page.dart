import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

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
        child: CreateDynamicPart(),
      ),
    );
  }
}


class CreateDynamicPart extends StatefulWidget {
  const CreateDynamicPart({super.key});

  @override
  State<CreateDynamicPart> createState() => _CreateDynamicPartState();
}

class _CreateDynamicPartState extends State<CreateDynamicPart> {
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();


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
          maxLines: null,
          decoration: InputDecoration(
            labelText: 'Note',
            border: OutlineInputBorder(),
          ),
        
        ),

        ElevatedButton(
          onPressed: (){},
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