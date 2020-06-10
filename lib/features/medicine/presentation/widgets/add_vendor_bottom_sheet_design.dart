import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/name_input.dart';

class AddVendorBottomSheetDesign extends StatefulWidget {
  @override
  _AddVendorBottomSheetDesignState createState() =>
      _AddVendorBottomSheetDesignState();
}

class _AddVendorBottomSheetDesignState
    extends State<AddVendorBottomSheetDesign> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

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
            color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              padding: EdgeInsets.all(18.0),
              alignment: Alignment.topLeft,
              child: Text(
                'New Vendor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.5,
              child: FormBuilder(
                key: _fbKey,
                child: ListView(
                  children: <Widget>[
                    NameInput(field: 'Name'),
                    NameInput(field: 'Address'),
                    NameInput(field: 'Email'),
                    NameInput(field: 'Phone Number'),
                  ],
                ),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 16),
              child: Text(
                'Done',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Colors.black,
              onPressed: () {
                if (_fbKey.currentState.validate()) {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
