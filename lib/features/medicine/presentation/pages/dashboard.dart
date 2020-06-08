import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/expandable_list_view.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.1,
          ),
          SizedBox(
            height: height * 0.7,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ExpandableListView(title: "Title $index");
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
