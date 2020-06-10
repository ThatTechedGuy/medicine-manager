import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateMedicineSlider extends StatelessWidget {
  final String field;

  const UpdateMedicineSlider({@required this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbColor: Colors.black,
          activeTrackColor: Colors.black,
          inactiveTrackColor: Colors.grey[200],
        ),
        child: FormBuilderSlider(
          attribute: 'Quantity Slider',
          min: 0,
          max: 100,
          initialValue: 0,
          decoration: InputDecoration(
            labelText: '$field',
            labelStyle: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          divisions: 20,
        ),
      ),
    );
  }
}
