import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tigernote/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);

  TextEditingController _TitleController = TextEditingController();
  String date = DateFormat("yyyy-MM-dd 'à' HH:mm:ss 'UTC'")
      .format(DateTime.now().toUtc());
  TextEditingController _MainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Ajouter une nouvelle Note",
            style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _TitleController,
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Le Titre de la note'),
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _MainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Le Contenu de la note'),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppStyle.cardsColor[color_id + 1 & color_id],
        onPressed: () async {
          if (_TitleController.text.isEmpty || _MainController.text.isEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: AppStyle.cardsColor[color_id + 1 & color_id-1],
                  title: Text("Champs obligatoires"),
                  content: Text("Veuillez remplir tous les champs."),
                  actions: <Widget>[
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            FirebaseFirestore.instance.collection("Notes").add({
              "note_title": _TitleController.text,
              "creation_date": date,
              "note_content": _MainController.text,
              "color_id": color_id
            }).then((value) {
              print(value.id);
              Navigator.pop(context);
            }).catchError(
                (error) => print("Erreur de l'ajout de votre note $error "));
          }
        },
        label: Text(
          "Enregistrer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        icon: Icon(Icons.save),
      ),
    );
  }
}
