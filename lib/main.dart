import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/medicine_page.dart';

void main() {
  runApp(MedicineManager());
}

class MedicineManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Manager',
      home: MedicinePage(),
    );
  }
}
