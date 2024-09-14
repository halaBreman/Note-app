import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiiii/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, this.maxline = 1, this.onSaved, this.onChanged}) : super(key: key);

  final String hint;
  final int maxline;

  final void Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged,
      onSaved: onSaved,
      validator: ((value) {
        if(value?.isEmpty ?? true){
          return 'Field is requird';
        }
      }),
      cursorColor: kPrimaryColor,
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hint,
        border: bulidborder(),
        enabledBorder: bulidborder(),
        focusedBorder: bulidborder(kPrimaryColor),

      ),
    );
  }
}
OutlineInputBorder bulidborder([color])
{
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color?? Colors.white)
  );
}


