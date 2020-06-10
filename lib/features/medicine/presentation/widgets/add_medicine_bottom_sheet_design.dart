import 'package:flutter/material.dart';

class AddMedicineBottomSheetDesign extends StatefulWidget {
  @override
  _AddMedicineBottomSheetDesignState createState() =>
      _AddMedicineBottomSheetDesignState();
}

class _AddMedicineBottomSheetDesignState
    extends State<AddMedicineBottomSheetDesign> {
  final _formKey = GlobalKey<FormState>();

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
                'New Medicine',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
                height: height * 0.40,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      NameInput(field: 'Name',),
                      NameInput(field: 'Description'),
                      NameInput(field: 'Price',),
                    ],
                  ),
                )),
            FlatButton(
              child: Text('Done'),
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NameInput extends StatelessWidget {
 final String field;

  const NameInput({this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: '$field',
          hintText: 'Enter medicine $field',
          filled: true,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
