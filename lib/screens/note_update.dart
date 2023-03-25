import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tigernote/screens/home_screen.dart';
import 'package:tigernote/style/app_style.dart';

class NoteUpdateScreen extends StatefulWidget {
  const NoteUpdateScreen({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  _NoteUpdateScreenState createState() => _NoteUpdateScreenState();
}

class _NoteUpdateScreenState extends State<NoteUpdateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.doc['note_title']);
    _contentController =
        TextEditingController(text: widget.doc['note_content']);
  }

  @override
  Widget build(BuildContext context) {
    var color = widget.doc["color_id"];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color],
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Modifier la Note',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Titre de la note'),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.doc['creation_date'],
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _contentController,
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Contenu de la note'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppStyle.cardsColor[color + 1 & color],
        onPressed: () async {
          if (_titleController.text.isEmpty ||
              _contentController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Veuillez remplir tous les champs'),
                backgroundColor: Colors.red,
              ),
            );
          } else {
            await widget.doc.reference.update({
              'note_title': _titleController.text,
              'note_content': _contentController.text,
            });
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        label: const Text(
          'Enregistrer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        icon: const Icon(Icons.save),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
