import 'package:flutter/material.dart';
import 'package:dclic_project_noteapp/pages/create_notes_page.dart';
import 'package:dclic_project_noteapp/main.dart';


class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.grey[800],
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "MyNotes",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            
              
            
            ListTile(
              title: Text("Olga smith", style: TextStyle(
                fontSize: 14, color: Colors.yellow[100]
              ),),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.delete, color: Colors.red[400], size: 35)
              ),
              
            ),

            ListTile(
              title: Text(
                'Créer nouveau profil',
                style: TextStyle(
                fontSize: 14, color: Colors.yellow[100]
              ),
              ),
              trailing:  IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }, 
            icon: Icon(Icons.add_circle_rounded, color: Colors.yellow[400], size: 35),
          ),
            ),

           
          ],
        ),
      ), 
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
        leading: IconButton(
          onPressed: (){
            return _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.grey[280])
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNotePage()));
            }, 
            icon: Icon(Icons.add_circle_rounded, size: 30),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: NotesDynamicPart(),
        ),
    );
  }
}

class NotesDynamicPart extends StatefulWidget {
  const NotesDynamicPart({super.key});

  @override
  State<NotesDynamicPart> createState() => _NotesDynamicPartState();
}

class _NotesDynamicPartState extends State<NotesDynamicPart> {
  final _searchController = TextEditingController();
  final List<String> notes = ["hello"];
 
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      spacing: 30,
      children: [
        Row(
          spacing: 12.0,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  labelText: "Search...",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[200],
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                elevation: 0,

              ),
             
              child: Text(
                "Ok",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, )
              ),
            ),
          ],
        ),
        Column(
          
          children: <Widget>[
            notes.isEmpty? Container(
              alignment: Alignment.center, 
             
              constraints: BoxConstraints(
                minHeight: 500,
                maxHeight: double.infinity
              ),
              child: Text('happening'),
            ): ListView.builder(itemCount: notes.length, shrinkWrap: true, itemBuilder: (context, i){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(12),
                color: Colors.grey[800] ,
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          'titre',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.yellow[100],
                            fontWeight: FontWeight.bold,
                          ),
                          
                        ),
                         Text(
                          'Some text to see the result',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.yellow[100],
                          ),
                          
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.edit, color: Colors.yellow[400])
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.delete, color: Colors.red[400])
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
       ]
    )
    );
  }
}