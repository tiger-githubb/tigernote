import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tigernote/screens/note_editor.dart';
import 'package:tigernote/screens/note_update.dart';
import 'package:tigernote/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    var color = widget.doc["color_id"];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color],
      appBar: AppBar(
              title: Text( widget.doc['note_title'] ,style: TextStyle(color:Colors.black, fontWeight: FontWeight.w600)),

        backgroundColor: AppStyle.cardsColor[color],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
          Text(
            widget.doc["creation_date"],
            style: AppStyle.dateTitle,
          ),
            const SizedBox(height: 20.0),
            Text(
              widget.doc['note_content'],
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteUpdateScreen(
                doc: widget.doc,
              ),
            ),
          );
        },
        label: Text(
          'Modifier',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        icon: Icon(Icons.edit),
      ),
    );
  }
}
