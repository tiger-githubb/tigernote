import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tigernote/style/app_style.dart';


import '../screens/home_screen.dart';

Widget noteCard(
    Function(QueryDocumentSnapshot)? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: () => onTap?.call(doc),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: AppStyle.mainTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            doc["creation_date"],
            style: AppStyle.dateTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(doc["note_content"], style: AppStyle.mainContent, maxLines: 2),

          // Add delete button
          Row(
           mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => deleteNote(doc.id),
                ),
              ],
          ),
        ],
      ),
    ),
  );
}
