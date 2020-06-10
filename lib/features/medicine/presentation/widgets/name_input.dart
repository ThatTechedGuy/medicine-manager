import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NameInput extends StatelessWidget {
  final String field;

  const NameInput(
      {@required this.field,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: FormBuilderTextField(
        attribute: '$field',
        decoration: InputDecoration(
          labelText: '$field',
          hintText: 'Enter $field',
        ),
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.max(70),
        ],
      ),
    );
  }
}
