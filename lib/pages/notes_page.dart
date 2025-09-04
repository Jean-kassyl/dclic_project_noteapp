import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: (){},
          icon: Icon(Icons.menu, color: Colors.grey[280])
        ),
        actions: [
          IconButton(
            onPressed: (){},
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
    return Column(
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
        ListView.builder(itemCount: notes.length,shrinkWrap: true, itemBuilder: (context, i) {
          return Text("Une premiere note pour vous");}
    )],
    );
  }
}