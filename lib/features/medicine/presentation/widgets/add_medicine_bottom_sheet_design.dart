import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/name_input.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/add_medicine_slider.dart';
import 'package:intl/intl.dart';

class AddMedicineBottomSheetDesign extends StatefulWidget {
  @override
  _AddMedicineBottomSheetDesignState createState() =>
      _AddMedicineBottomSheetDesignState();
}

class _AddMedicineBottomSheetDesignState
    extends State<AddMedicineBottomSheetDesign> {
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
                'New Medicine',
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
                    NameInput(
                      field: 'Name',
                    ),
                    NameInput(
                      field: 'Description',
                    ),
                    NameInput(
                      field: 'Price',
                    ),
                    AddMedicineSlider(
                      field: 'Quantity',
                    ),
                    AddMedicineSlider(
                      field: 'Minimum Quantity',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FormBuilderDateTimePicker(
                        validator: FormBuilderValidators.required(),
                        attribute: "date",
                        inputType: InputType.date,
                        format: DateFormat("yyyy-MM-dd"),
                        decoration: InputDecoration(labelText: 'Expiry Date'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        attribute: 'Vendor',
                        decoration: InputDecoration(labelText: 'Vendor'),
                        // initialValue: 'Male',
                        hint: Text('Select Vendor'),
                        validators: [FormBuilderValidators.required()],
                        //TODO : Fill items list with available vendors
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
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
