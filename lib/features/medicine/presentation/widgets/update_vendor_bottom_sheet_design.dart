import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/update_name_input.dart';

class UpdateVendorBottomSheetDesign extends StatefulWidget {
  @override
  _UpdateMedicineBottomSheetDesignState createState() =>
      _UpdateMedicineBottomSheetDesignState();
}

class _UpdateMedicineBottomSheetDesignState
    extends State<UpdateVendorBottomSheetDesign> {
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
                'Update Vendor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.45,
              child: FormBuilder(
                key: _fbKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        attribute: 'ID',
                        decoration: InputDecoration(labelText: 'ID'),
                        // initialValue: 'Male',
                        hint: Text('Select ID'),
                        validators: [FormBuilderValidators.required()],
                        //TODO : Fill items list with available medicines
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                    ),
                    UpdateNameInput(
                      field: 'Name',
                    ),
                    UpdateNameInput(
                      field: 'Email',
                    ),
                    UpdateNameInput(
                      field: 'Phone Number',
                    ),
                    UpdateNameInput(
                      field: 'Address',
                    ),
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
