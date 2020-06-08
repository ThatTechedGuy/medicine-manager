import 'package:flutter/material.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/add_bottomsheet_tile.dart';

class BottomSheetDesign extends StatelessWidget {
  final List<String> option;

  BottomSheetDesign({@required this.option});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: height * 0.03,),
            Container(
              child: Center(
                child: Text('Enter ALL details (Remember to scroll down)'),
              ),
            ),
            SizedBox(
              height: height * 0.45,
              child: ListView.builder(
                itemBuilder: (context, index) => AddBottomSheetTiles(
                  field: option[index],
                ),
                itemCount: option.length,
              ),
            ),
            FlatButton(
              child: Text('Done'),
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
