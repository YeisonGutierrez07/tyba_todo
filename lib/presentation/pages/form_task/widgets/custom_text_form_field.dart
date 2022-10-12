import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.decoration,
  });

  final InputDecoration? decoration;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: decoration,
      maxLines: 4,
      onSaved: (String? value) {},
      validator: (String? value) {
        return (value == '') ? 'Este campo es requerido' : null;
      },
    );
  }
}
