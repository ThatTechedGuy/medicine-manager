import 'package:flutter/material.dart';

class AddBottomSheetTiles extends StatelessWidget {
  final String field;

  const AddBottomSheetTiles({@required this.field});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text('$field'),
          Expanded(
            child: Container(
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}