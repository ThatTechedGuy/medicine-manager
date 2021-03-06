import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:medicine_manager/core/api.dart';
import 'package:medicine_manager/features/medicine/presentation/pages/medicine_page.dart';

void main() {
  runApp(MedicineManager());
}

class MedicineManager extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          accentColor: Colors.black,
          primaryColor: Colors.black,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            errorStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: 'Medicine Manager',
        home: MedicinePage(),
      ),
    );
  }
}
