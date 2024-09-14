import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiiii/cubits/notes_cubits/notes_cubit.dart';
import 'package:iiiii/models/note_model.dart';
import 'custom-note-iteam.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes= BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: NoteIteam(
                    note: notes[i],
                  ),
                );
              }
          ),
        );
      },
    );
  }
}