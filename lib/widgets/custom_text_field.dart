import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final int maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.validator,
    this.onSaved,
    this.maxLines = 1,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onSaved: onSaved,
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}