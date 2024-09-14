import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:iiiii/cubits/notes_cubits/notes_cubit.dart';
import 'package:iiiii/models/note_model.dart';

import 'package:iiiii/views/edit-note-view.dart';

class NoteIteam extends StatelessWidget {
  const NoteIteam({Key? key, required this.note}) : super(key: key);

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EditNoteView()));
       Navigator.push(context , MaterialPageRoute(
           builder: (context)=> EditNoteView(
             note: note,
           ))) ;
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius:  BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 14,bottom: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize:15,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed:(){
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                } ,
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 23,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                note.date,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),),
            ),
          ],
        ),

      ),
    );
  }
}