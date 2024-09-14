import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiiii/cubits/notes_cubits/notes_cubit.dart';
import 'package:iiiii/views/widgets/add-note-button-sheet.dart';
import 'package:iiiii/views/widgets/notes-view-body.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
            Icons.add
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}


