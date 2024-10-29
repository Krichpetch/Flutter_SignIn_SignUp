// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/constant.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                    // icon: const Icon(Icons.email),
                    label: Text(labelText, style: textSubTitle),
                    hintText: hintText,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: highlightTertiary),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: highlightSecondary),
                      gapPadding: 10,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              );
  }
}
