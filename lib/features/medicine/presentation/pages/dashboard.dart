import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/expandable_list_view.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ExpandableListView(title: "Title $index");
      },
      itemCount: 5,
    );
  }
}