import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:hive/hive.dart';
import 'package:iiiii/constants.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';



part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Color(0xff2FBF71);
  addNote(NoteModel note) async {
    note.color=color.value;
    emit(AddNoteloading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }

  }
}
