import 'package:flutter/material.dart';
import 'package:quizz/core/utils/constants/text_fields_constants.dart';

class TextFieldPassword extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode node;

  const TextFieldPassword({
    super.key,
    required this.hintText,
    required this.controller,
    required this.node,
  });

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.node,
      obscureText: isObscure,
      decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: IconButton(
            onPressed: () => setState(() => isObscure = !isObscure),
            icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          )),
      style: TextStyle(color: TextFormFieldStyle.fontColor(context)),
      obscuringCharacter: TextFormFieldStyle.obscuringCharacter,
      cursorColor: TextFormFieldStyle.cursorColor(context),
    );
  }
}
