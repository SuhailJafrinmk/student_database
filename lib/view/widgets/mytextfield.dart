import 'package:flutter/material.dart';
import 'package:student_database/view/app_colors.dart';

class MyTextfield extends StatefulWidget {
  final int maxline;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool textenable;
  final String? Function(String?)? validator;

  const MyTextfield(
      {super.key,
      required this.maxline,
      required this.label,
      required this.hintText,
      required this.controller,
      required this.textenable,
      this.validator});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.textenable,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        fillColor: ColorsApp.secondaryColor,
        filled: true,
        label: Text(widget.label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
