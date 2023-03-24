import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tigernote/style/app_style.dart';

Widget noteCard(
    Function(QueryDocumentSnapshot)? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: () => onTap?.call(doc),
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[1],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: AppStyle.mainTitle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            doc["creation_date"].toDate().toString(),
            style: AppStyle.dateTitle,
          ),
                    SizedBox(
            height: 12,
          ),
          Text(doc["note_content"], style: AppStyle.mainContent, maxLines:4)
        ],
      ),
    ),
  );
}
