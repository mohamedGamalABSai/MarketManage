import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hint,
    required this.textEditingController,
    required this.validate,
    this.onChange,
    this.maxLines = 1,
  });

  final String hint;
  final TextEditingController textEditingController;
  final String? Function(String?) validate;
  final void Function(String?)? onChange;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        maxLines: maxLines,
        controller: textEditingController,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          focusColor: Colors.green,
        ),
        textInputAction: TextInputAction.next,
        cursorColor: Colors.green,
        validator: validate,
        onChanged: onChange,
      ),
    );
  }
}
