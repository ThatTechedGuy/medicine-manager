import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:medicine_manager/features/medicine/presentation/widgets/name_input.dart';

class TransactionsBottomSheetDesign extends StatefulWidget {
  final String transactionName;
  @override

  TransactionsBottomSheetDesign({@required this.transactionName});

  _TransactionsBottomSheetDesignState createState() =>
      _TransactionsBottomSheetDesignState();
}

class _TransactionsBottomSheetDesignState extends State<TransactionsBottomSheetDesign> {
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
                '${widget.transactionName}',
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
                      field: 'Medicine Name',
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: FormBuilderDropdown(
                        attribute: 'Medicine Quantity',
                        decoration:
                            InputDecoration(labelText: 'Medicine Quantity'),
                        // initialValue: 'Male',
                        hint: Text('Select the quantity of medicine'),
                        validators: [FormBuilderValidators.required()],
                        //TODO : Fill items list with available medicines
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
