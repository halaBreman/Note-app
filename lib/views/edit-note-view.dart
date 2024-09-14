import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiiii/views/widgets/edit-note-view-body.dart';

import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EditNoteViewBody(
          note: note,
        ),
    );
  }
}
