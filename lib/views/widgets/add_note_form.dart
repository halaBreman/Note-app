import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iiiii/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:iiiii/models/note_model.dart';
import 'package:intl/intl.dart';
import 'colors_list_view.dart';
import 'costem-text-field.dart';
import 'costom-button.dart';
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
  super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey= GlobalKey();
  AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            hint: 'Title',
            onSaved: (value) {
              title=value;
            } ,),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            hint: 'Content',
            maxline: 5,
            onSaved: (value) {
              subtitle=value;
            } ,),
          const SizedBox(
            height: 16,
          ),
          const colorListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CostomButton(
                isLoading: state is AddNoteloading? true : false,
                onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                    DateFormat('M,dd,yyyy').format(currentDate);
                    var noteModel =NoteModel(
                    title: title!, subTitle: subtitle!,
                    date: formattedCurrentDate,
                    color: Colors.purpleAccent.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode= AutovalidateMode.always;
                    setState(() {});
              }
            },
          );
  },
),
          const SizedBox(
            height: 16,
          ),

        ],
      ),
    );
  }
}

