import 'package:flutter/material.dart';

class TextFieldDinamico extends StatelessWidget {
  
  final TextEditingController controller = TextEditingController();
  TextInputType keyboardType;
  String labelText;

  TextFieldDinamico(this.labelText, this.keyboardType);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: labelText ?? ''),
    );
  }
}

